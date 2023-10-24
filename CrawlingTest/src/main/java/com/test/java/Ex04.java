package com.test.java;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.edge.EdgeDriver;

public class Ex04 {

	public static void main(String[] args) {

		//Jsoup -> Selenium(셀레니움)
		//테스트 자동화 도구
		
		//1. 셀레니움 라이브러리
		//2. 브라우저 드라이버
		
		//https://googlechromelabs.github.io/chrome-for-testing/#stable
		
//		m1();
//		m2();
		m3();
	}

	private static void m3() {
		String webDriverID = "webdriver.msedgedriver.driver";
		String path = "C:\\class\\dev\\msedgedriver.exe";
		
		System.setProperty(webDriverID, path);
		
		WebDriver driver = new EdgeDriver();
		String url = "http://localhost:8090/memo/list.do";
		driver.get(url);
		
		
		WebElement btn1 = driver.findElement(By.id("btn1"));
		btn1.click();
		
		WebElement result = driver.findElement(By.id("result"));
		System.out.println(result.getText());
	}

	private static void m2() {
		String webDriverID = "webdriver.msedgedriver.driver";
		String path = "C:\\class\\dev\\msedgedriver.exe";
		
		System.setProperty(webDriverID, path);
		
		WebDriver driver = new EdgeDriver();
		String url = "http://lms1.sist.co.kr/worknet/SLogin.asp";
		driver.get(url);
		
		WebElement id = driver.findElement(By.id("strLoginID"));
		WebElement pw = driver.findElement(By.id("strLoginPwd"));
		
		id.sendKeys("염현빈");
		pw.sendKeys("5498");
		
		WebElement btn = driver.findElement(By.cssSelector("#content > div > form > table > tbody > tr > td > div > div.login-form > div.login-btn > input"));
		
		btn.click();
		
		//페이지 전환 -> 딜레이 발생
		try {
//			driver.wait(1000);
			Thread.sleep(1000);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//로그인이 되지 않은채로 실행되면 콘솔창에 출력되지 않음
		WebElement td = driver.findElement(By.cssSelector("#content > div > div > div > div.panel-body > form > table > thead > tr:nth-child(5) > td:nth-child(2)"));
		System.out.println(td.getText());
		
	}

	private static void m1() {
		
//		String webDriverID = "webdriver.chrome.driver";
		String webDriverID = "webdriver.msedgedriver.driver";
//		String path = "C:\\class\\dev\\chromedriver.exe";
		String path = "C:\\class\\dev\\msedgedriver.exe";
		
		System.setProperty(webDriverID, path);
		
//		ChromeOptions options = new ChromeOptions();
//		options.setCapability("ignoreProtectedModeSettings", true);

		//브라우저 참조 객체
//		WebDriver driver = new ChromeDriver(options);
		WebDriver driver = new EdgeDriver();
		String url = "http://naver.com";
		driver.get(url);
		
		//네이버 검색창
		WebElement query = driver.findElement(By.id("query"));
		query.sendKeys("에르메스");
		
		//검색 버튼
		WebElement btn = driver.findElement(By.className("btn_search"));
		btn.click();
		
	}

}
