package pict_admin.web;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;

import java.net.URL;
import java.security.MessageDigest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.PasswordAuthentication;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pict_admin.service.AdminService;
import pict_admin.service.AdminVO;
import pict_admin.service.PictService;
import pict_admin.service.PictVO;
import org.apache.commons.codec.binary.Base64;

@Controller
public class pictController {
	PasswordAuthentication pa;
	
	@Resource(name = "pictService")
	private PictService pictService;
	
	@Resource(name = "adminService")
	private AdminService adminService;
	
	
	@RequestMapping(value = "/main.do")
	public String main(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {
		List<?> board_list = pictService.project_list(pictVO);
		model.addAttribute("board_list", board_list);
		
		return "pict/main/main";
	}
	
	@RequestMapping(value = "/about.do")
	public String about(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		return "pict/main/about";
	}
	
	@RequestMapping(value = "/project.do")
	public String project(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {
		List<?> board_list = pictService.project_list(pictVO);
		model.addAttribute("board_list", board_list);
		model.addAttribute("pictVO", pictVO);
		return "pict/main/project";
	}
	
	@RequestMapping(value = "/project_view.do")
	public String project_view(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {
		pictVO = pictService.project_list_one(pictVO);
		model.addAttribute("pictVO", pictVO);
		return "pict/main/project_view";
	}

	@RequestMapping(value = "/partners.do")
	public String partners(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		return "pict/main/partners";
	}
	
	@RequestMapping(value = "/pict_main.do")
	public String pict_main(@ModelAttribute("searchVO") AdminVO adminVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {
		String sessions = (String)request.getSession().getAttribute("id");
		System.out.println(sessions);
		if(sessions == null || sessions == "null") {
			return "redirect:/pict_login.do";
		}
		else {
			String user_id = (String)request.getSession().getAttribute("id");
			if(request.getSession().getAttribute("id") != null) {
				adminVO.setAdminId((String)request.getSession().getAttribute("id"));
				adminVO = adminService.get_user_info(adminVO);
				model.addAttribute("adminVO", adminVO);
			}
		
			return "redirect:/admin/project_list.do";
		
		}
	}
	
	@RequestMapping(value = "/pict_login.do")
	public String login_main(@ModelAttribute("searchVO") AdminVO adminVO, HttpServletRequest request, ModelMap model, HttpServletResponse response) throws Exception {

		String sessions = (String)request.getSession().getAttribute("id");
		if(sessions == null || sessions == "null") {
			return "pict/admin/login";
		}
		else {
			//나중에 여기 계정별로 리다이렉트 분기처리
			return "redirect:/admin/project_list.do";
			
		}
			
	}
	
	@RequestMapping(value = "/login.do")
	public String login(@ModelAttribute("adminVO") AdminVO adminVO, HttpServletRequest request,  ModelMap model) throws Exception {
		//처음 드러와서 세션에 정보있으면 메인으로 보내줘야함
		String inpuId = adminVO.getAdminId();
		String inputPw = adminVO.getAdminPw();
		
		adminVO = adminService.get_user_info(adminVO);

		if (adminVO != null && adminVO.getId() != null && !adminVO.getId().equals("")) {
			String user_id = adminVO.getId();
			String enpassword = encryptPassword(inputPw, inpuId);	//입력비밀번호
			
			if(enpassword.equals(adminVO.getPassword())) {
				request.getSession().setAttribute("id", adminVO.getId());
				request.getSession().setAttribute("name", adminVO.getName());
				request.getSession().setAttribute("depart", adminVO.getDepart());

				String ip = request.getRemoteAddr();
			    DateFormat format2 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			    String now = format2.format(Calendar.getInstance().getTime());
			    
			    adminVO.setLast_login_ip(ip);
			    adminVO.setLast_login_date(now);
			    adminService.insert_login_info(adminVO);
			    
			    adminVO.setAdminId(user_id);
			    adminVO = adminService.get_user_info(adminVO);
			    
				return "redirect:/pict_main.do";
				
			}
			else {
				model.addAttribute("message", "입력하신 정보가 일치하지 않습니다.");
				model.addAttribute("retType", ":location");
				model.addAttribute("retUrl", "/pict_login.do");
				return "pict/main/message";
			}
		}
		else {
			model.addAttribute("message", "입력하신 정보가 일치하지 않습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/pict_login.do");
			return "pict/main/message";
		}
	}
	@RequestMapping(value = "/logout.do")
	public String logout(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request,  ModelMap model) throws Exception {
		request.getSession().setAttribute("id", null);
		request.getSession().setAttribute("name", null);
		
		return "redirect:/pict_login.do";
		
	}
	
	
	@RequestMapping(value = "/mypage_login.do")
	public String mypage_login(@ModelAttribute("searchVO") AdminVO adminVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {
		String sessions = (String)request.getSession().getAttribute("id");	
		
		if(sessions == null || sessions == "null") {
			return "pict/main/mypage_login";
		}
		else {
			Date now = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			String formatedNow = formatter.format(now);
			System.out.println(formatedNow);
			
			//여기 날짜 체크해서 10/7일만 mypage.do 보내고 / 이외에는 mypage_tap.do로 보내
			if(formatedNow.equals("2024-10-07")) {
				return "redirect:/mypage.do";
			}
			else {
				return "redirect:/mypage_tap.do";
			}
			
		}
	}
	@RequestMapping(value = "/login_action.do")
	public String login_action(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {
		String inpuName = pictVO.getName();
		String inputMobile = pictVO.getMobile();
		
		pictVO = pictService.get_register_person_info(pictVO);

		if (pictVO != null) {
			String name = pictVO.getName();
			String mobile = pictVO.getMobile();
			
			if(inpuName.equals(name) && inputMobile.equals(mobile)) {
				request.getSession().setAttribute("idx", pictVO.getIdx());
				
				Date now = new Date();
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				String formatedNow = formatter.format(now);
				System.out.println(formatedNow);
				
				//여기 날짜 체크해서 10/7일만 mypage.do 보내고 / 이외에는 mypage_tap.do로 보내
				if(formatedNow.equals("2024-10-07")) {
					return "redirect:/mypage.do";
				}
				else {
					return "redirect:/mypage_tap.do";
				}
				
				
			}
			else {
				model.addAttribute("message", "입력하신 정보가 일치하지 않습니다.");
				model.addAttribute("retType", ":location");
				model.addAttribute("retUrl", "/mypage_login.do");
				return "pict/main/message";
			}
		}
		else {
			model.addAttribute("message", "입력하신 정보가 일치하지 않습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/mypage_login.do");
			return "pict/main/message";
		}
		
	}
	@RequestMapping(value = "/mypage.do")
	public String mypage(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {
		String idx = request.getSession().getAttribute("idx").toString();
		pictVO.setIdx(Integer.parseInt(idx));
		pictVO = pictService.get_person_info(pictVO);
		model.addAttribute("pictVO", pictVO);
		
		return "pict/main/mypage";
	}
	@RequestMapping(value = "/mypage_tap.do")
	public String mypage_tap(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {
		String idx = request.getSession().getAttribute("idx").toString();
		pictVO.setIdx(Integer.parseInt(idx));
		pictVO = pictService.get_person_info(pictVO);
		model.addAttribute("pictVO", pictVO);
		
		return "pict/main/mypage_tap";
	}
	
	@RequestMapping(value = "/admin/bus_list.do")
	public String bus_list(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {
		String userAgent = request.getHeader("user-agent");
		boolean mobile1 = userAgent.matches( ".*(iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson).*");
		boolean mobile2 = userAgent.matches(".*(LG|SAMSUNG|Samsung).*"); 
		if (mobile1 || mobile2) {
		    //여기 모바일일 경우
			model.addAttribute("intype", "mobile");
		}
		else {
			model.addAttribute("intype", "pc");
		}
		List<?> board_list = pictService.bus_list(pictVO);
		model.addAttribute("resultList", board_list);
		model.addAttribute("pictVO", pictVO);
		
		return "pict/admin/bus_list";
	}

	@RequestMapping(value = "/apply.do")
	public String apply(@ModelAttribute("searchVO") AdminVO adminVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		return "pict/main/apply";
	}
	
	@RequestMapping(value = "/register_cancel.do")
	public String register_cancel(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		pictService.register_cancel(pictVO);
		request.getSession().setAttribute("idx", null);
		model.addAttribute("message", "참가등록이 취소되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/");
		return "pict/main/message";
	}
	
	@RequestMapping(value = "/admin/project_list.do")
	public String user_list(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {
		int limitNumber = 20;
        pictVO.setLimit(limitNumber);
        Integer pageNum = Integer.valueOf(pictVO.getPageNumber());
        if (pageNum.intValue() == 0) {
          pictVO.setPageNumber(1);
          pageNum = Integer.valueOf(1);
        } 
        int startNum = (pageNum.intValue() - 1) * limitNumber;
        pictVO.setStartNumber(startNum);
        Integer totalCnt = this.pictService.project_list_cnt(pictVO);
        int lastPageValue = (int)Math.ceil(totalCnt.intValue() * 1.0D / 20.0D);
        pictVO.setLastPage(lastPageValue);
        Integer s_page = Integer.valueOf(pageNum.intValue() - 4);
        Integer e_page = Integer.valueOf(pageNum.intValue() + 5);
        if (s_page.intValue() <= 0) {
          s_page = Integer.valueOf(1);
          e_page = Integer.valueOf(10);
        } 
        if (e_page.intValue() > lastPageValue)
          e_page = Integer.valueOf(lastPageValue); 
        pictVO.setStartPage(s_page.intValue());
        pictVO.setEndPage(e_page.intValue());
        model.addAttribute("pictVO", pictVO);
        model.addAttribute("board_cnt", totalCnt);
		
		
		List<?> board_list = pictService.project_list(pictVO);
		model.addAttribute("resultList", board_list);
		model.addAttribute("pictVO", pictVO);
		
		return "pict/admin/project_list";
	}
	@RequestMapping(value = "/admin/project_register.do")
	public String project_register(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		if(pictVO.getIdx() != 0) {
			//수정
			pictVO = pictService.project_list_one(pictVO);
			pictVO.setSaveType("update");
			
		}
		else {
			pictVO.setSaveType("insert");
		}
		
		model.addAttribute("pictVO", pictVO);
		return "pict/admin/project_register";
	}
	@RequestMapping(value = "/admin/project_save.do", method = RequestMethod.POST)
	public String project_save(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, MultipartHttpServletRequest request,
			@RequestParam("attach_file1") MultipartFile attach_file1,
			@RequestParam("attach_file2") MultipartFile attach_file2,
			@RequestParam("attach_file3") MultipartFile attach_file3,
			@RequestParam("attach_file4") MultipartFile attach_file4,
			@RequestParam("attach_file5") MultipartFile attach_file5,
			@RequestParam("attach_file6") MultipartFile attach_file6,
			@RequestParam("attach_file7") MultipartFile attach_file7,
			@RequestParam("attach_file8") MultipartFile attach_file8,
			@RequestParam("attach_file9") MultipartFile attach_file9,
			@RequestParam("attach_file10") MultipartFile attach_file10,
			@RequestParam("attach_file11") MultipartFile attach_file11,
			@RequestParam("attach_file12") MultipartFile attach_file12,
			@RequestParam("attach_file13") MultipartFile attach_file13,
			@RequestParam("attach_file14") MultipartFile attach_file14,
			@RequestParam("attach_file15") MultipartFile attach_file15
			) throws Exception {
		
		if (attach_file1.getSize() != 0) {
		    String uploadPath = fileUpload(request, attach_file1, (String) request.getSession().getAttribute("id"));
		    String filepath = "/user1/upload_file/design/";
		    String filename = uploadPath.split("#####")[1];
		    pictVO.setImg_url1(filepath + filename);
		}

		if (attach_file2.getSize() != 0) {
		    String uploadPath = fileUpload(request, attach_file2, (String) request.getSession().getAttribute("id"));
		    String filepath = "/user1/upload_file/design/";
		    String filename = uploadPath.split("#####")[1];
		    pictVO.setImg_url2(filepath + filename);
		}

		if (attach_file3.getSize() != 0) {
		    String uploadPath = fileUpload(request, attach_file3, (String) request.getSession().getAttribute("id"));
		    String filepath = "/user1/upload_file/design/";
		    String filename = uploadPath.split("#####")[1];
		    pictVO.setImg_url3(filepath + filename);
		}

		if (attach_file4.getSize() != 0) {
		    String uploadPath = fileUpload(request, attach_file4, (String) request.getSession().getAttribute("id"));
		    String filepath = "/user1/upload_file/design/";
		    String filename = uploadPath.split("#####")[1];
		    pictVO.setImg_url4(filepath + filename);
		}

		if (attach_file5.getSize() != 0) {
		    String uploadPath = fileUpload(request, attach_file5, (String) request.getSession().getAttribute("id"));
		    String filepath = "/user1/upload_file/design/";
		    String filename = uploadPath.split("#####")[1];
		    pictVO.setImg_url5(filepath + filename);
		}

		if (attach_file6.getSize() != 0) {
		    String uploadPath = fileUpload(request, attach_file6, (String) request.getSession().getAttribute("id"));
		    String filepath = "/user1/upload_file/design/";
		    String filename = uploadPath.split("#####")[1];
		    pictVO.setImg_url6(filepath + filename);
		}

		if (attach_file7.getSize() != 0) {
		    String uploadPath = fileUpload(request, attach_file7, (String) request.getSession().getAttribute("id"));
		    String filepath = "/user1/upload_file/design/";
		    String filename = uploadPath.split("#####")[1];
		    pictVO.setImg_url7(filepath + filename);
		}

		if (attach_file8.getSize() != 0) {
		    String uploadPath = fileUpload(request, attach_file8, (String) request.getSession().getAttribute("id"));
		    String filepath = "/user1/upload_file/design/";
		    String filename = uploadPath.split("#####")[1];
		    pictVO.setImg_url8(filepath + filename);
		}

		if (attach_file9.getSize() != 0) {
		    String uploadPath = fileUpload(request, attach_file9, (String) request.getSession().getAttribute("id"));
		    String filepath = "/user1/upload_file/design/";
		    String filename = uploadPath.split("#####")[1];
		    pictVO.setImg_url9(filepath + filename);
		}

		if (attach_file10.getSize() != 0) {
		    String uploadPath = fileUpload(request, attach_file10, (String) request.getSession().getAttribute("id"));
		    String filepath = "/user1/upload_file/design/";
		    String filename = uploadPath.split("#####")[1];
		    pictVO.setImg_url10(filepath + filename);
		}

		if (attach_file11.getSize() != 0) {
		    String uploadPath = fileUpload(request, attach_file11, (String) request.getSession().getAttribute("id"));
		    String filepath = "/user1/upload_file/design/";
		    String filename = uploadPath.split("#####")[1];
		    pictVO.setImg_url11(filepath + filename);
		}

		if (attach_file12.getSize() != 0) {
		    String uploadPath = fileUpload(request, attach_file12, (String) request.getSession().getAttribute("id"));
		    String filepath = "/user1/upload_file/design/";
		    String filename = uploadPath.split("#####")[1];
		    pictVO.setImg_url12(filepath + filename);
		}

		if (attach_file13.getSize() != 0) {
		    String uploadPath = fileUpload(request, attach_file13, (String) request.getSession().getAttribute("id"));
		    String filepath = "/user1/upload_file/design/";
		    String filename = uploadPath.split("#####")[1];
		    pictVO.setImg_url13(filepath + filename);
		}

		if (attach_file14.getSize() != 0) {
		    String uploadPath = fileUpload(request, attach_file14, (String) request.getSession().getAttribute("id"));
		    String filepath = "/user1/upload_file/design/";
		    String filename = uploadPath.split("#####")[1];
		    pictVO.setImg_url14(filepath + filename);
		}

		if (attach_file15.getSize() != 0) {
		    String uploadPath = fileUpload(request, attach_file15, (String) request.getSession().getAttribute("id"));
		    String filepath = "/user1/upload_file/design/";
		    String filename = uploadPath.split("#####")[1];
		    pictVO.setImg_url15(filepath + filename);
		}

		
		
		if(pictVO.getSaveType() != null && pictVO.getSaveType().equals("update")) {
			pictService.project_update(pictVO);
			model.addAttribute("message", "정상적으로 수정되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/admin/project_list.do");
			return "pict/main/message";
		}
		else {
			pictService.project_insert(pictVO);
			model.addAttribute("message", "정상적으로 저장되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/admin/project_list.do");
			return "pict/main/message";
			
		}
	}
	@RequestMapping(value = "/admin/project_delete.do")
	public String project_delete(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		pictService.project_delete(pictVO);
		model.addAttribute("message", "정상적으로 삭제되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/admin/project_list.do");
		return "pict/main/message";
	}

	//메소드
	public static String encryptPassword(String password, String id) throws Exception {
		if (password == null) return "";
		if (id == null) return ""; // KISA 보안약점 조치 (2018-12-11, 신용호)
		byte[] hashValue = null; // 해쉬값
	
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.reset();
		md.update(id.getBytes());
		hashValue = md.digest(password.getBytes());
	
		return new String(Base64.encodeBase64(hashValue));
    }

	public String fileUpload(MultipartHttpServletRequest request, MultipartFile uploadFile, String target) {
    	String path = "";
    	String path2 = "";
    	String fileName = "";
    	OutputStream out = null;
    	PrintWriter printWriter = null;
    	long fileSize = uploadFile.getSize();
    	try {
    		fileName = uploadFile.getOriginalFilename();
    		byte[] bytes = uploadFile.getBytes();
    		
			path = getSaveLocation(request, uploadFile);
    		
    		
    		File file = new File(path);
    		if(fileName != null && !fileName.equals("")) {
    			if(file.exists()) {
    				file = new File(path + fileName);
    			}
    		}
    		out = new FileOutputStream(file);
    		out.write(bytes);
    		
    		
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return path + "#####" + fileName;
    }
	
	private String getSaveLocation(MultipartHttpServletRequest request, MultipartFile uploadFile) {
    	String uploadPath = "/_nas/user1/cmsadmin2/upload_file/design/";
    	return uploadPath;
    }
}
