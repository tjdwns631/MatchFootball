package co.company.MatchFootball.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@Configuration
public class TilesConfig {
	@Bean
	public UrlBasedViewResolver viewResolver() {
		UrlBasedViewResolver tilesView = new UrlBasedViewResolver();
		tilesView.setOrder(2);
		tilesView.setViewClass(TilesView.class);
		return tilesView;
	}
	
	@Bean
	public TilesConfigurer tilesConfigurer() {
		TilesConfigurer tiles = new TilesConfigurer();
		tiles.setDefinitions(new String[] { "/WEB-INF/views/tiles/tiles.xml"});
		return tiles;
	}
}