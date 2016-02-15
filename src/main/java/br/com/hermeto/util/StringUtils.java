package br.com.hermeto.util;

public class StringUtils {

	static public String makeLink(String str)
	{
		return str.toLowerCase()
		.replaceAll("[����]", "a")
		.replaceAll("[��]", "e")
		.replaceAll("[�]", "i")
		.replaceAll("[����]", "o")
		.replaceAll("[���]", "u")
		.replaceAll("[�]", "c")
		.replaceAll("[^a-z0-9 -]", "")
		.replaceAll("[ -]+", "-");
	}
	
	static public String makeLinkKeepSlash(String str)
	{
		return str.toLowerCase()
		.replaceAll("[����]", "a")
		.replaceAll("[��]", "e")
		.replaceAll("[�]", "i")
		.replaceAll("[����]", "o")
		.replaceAll("[���]", "u")
		.replaceAll("[�]", "c")
		.replaceAll("[^a-z0-9/ -]", "")
		.replaceAll("[ -]+", "-");
	}
	
	public static String normalizeFilename(String name)
	{
		String basename = name.replaceFirst("(.*)\\.(.*)", "$1").replaceAll("_+", "-").replaceAll("&", "-e-");
		if(!name.contains(".")) return StringUtils.makeLinkKeepSlash(basename); 
		String extension = name.replaceFirst(".*\\.(.*)", "$1");
		return StringUtils.makeLinkKeepSlash(basename) + "." + StringUtils.makeLinkKeepSlash(extension);
	}
	
}
