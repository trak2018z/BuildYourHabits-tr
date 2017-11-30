package buildyourhabits.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter{
	
	@Autowired
	public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception {
		auth.inMemoryAuthentication().withUser("Bartek").password("pass").roles("USER", "ADMIN");
		auth.inMemoryAuthentication().withUser("ZlyBartek").password("pass2").roles("USER");
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
//		http.authorizeRequests().antMatchers("./login").permitAll().
//			antMatchers("/", "/*habit*/**").access("hasRole('USER')").and()
//			.formLogin()
//			.loginPage("customizedLogin.jsp")
//			.loginProcessingUrl("./perform-login")
//            .defaultSuccessUrl("welcome.jsp")
//            .failureUrl("customizedLogin.jsp?error=true");
		
		http
			.authorizeRequests()
				.antMatchers("/resources/**").permitAll()
				.antMatchers("/webjars/**").permitAll()
				.antMatchers("/sign-up").permitAll()
				.anyRequest().authenticated()
			.and()
			.formLogin().loginPage("/login").permitAll()
			.and()
			.logout().permitAll();
			
	}
}