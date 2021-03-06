package com.wbs.core.util;

import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 系统工具类：
 * 
 * @author One_Eleven
 * 
 */
public abstract class SystemUtil {


	public static String getMemoryInfo( ) {
		return Runtime.getRuntime( ).totalMemory( ) / 1024L / 1024L + "M/" + Runtime.getRuntime( ).maxMemory( ) / 1024L / 1024L + "M";
	}

	public static String getJdkInfo( ) {
		return System.getProperty( "java.version" );
	}


	public static String getMacInfo( ) {
		String mac = "";
		try {
			Process process = Runtime.getRuntime( ).exec( "ipconfig /all" );
			InputStreamReader reader = new InputStreamReader( process.getInputStream( ), "gbk" );
			LineNumberReader input = new LineNumberReader( reader );
			String line;
			while ( ( line = input.readLine( ) ) != null ) {

				Pattern regex = Pattern.compile( "\\w{2}-\\w{2}-\\w{2}-\\w{2}-\\w{2}-\\w{2}", Pattern.DOTALL | Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE
						| Pattern.MULTILINE );
				Matcher regexMatcher = regex.matcher( line );
				if ( regexMatcher.find( ) ) {
					String tmp = regexMatcher.group( 0 );
					if ( !tmp.equals( "00-00-00-00-00-00" ) )
						mac += regexMatcher.group( 0 ) + ",";
				}
			}
		} catch ( Exception e ) {
			return "";
		}
		if ( mac.length( ) > 0 )
			mac = mac.substring( 0, mac.length( ) - 1 );
		return mac;
	}
}
