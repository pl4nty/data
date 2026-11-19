-- Threat: !InfrastructureShared
-- Name: !#Lua:LnkDblExt.JT!ibt
-- Type: 12
-- MpAttributes: BM_LNK_FILE & Lua:LNKExt

if mp.getfilesize() > 20480 then
  return mp.CLEAN
end
local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "->", 1, true) == nil then
  return mp.CLEAN
end
if l_0_0:len() < 9 then
  return mp.CLEAN
end
local l_0_1 = {
  [".doc"] = "",
  docm = "",
  docx = "",
  [".dot"] = "",
  dotm = "",
  dotx = "",
  [".odt"] = "",
  [".rtf"] = "",
  [".ods"] = "",
  [".xla"] = "",
  [".xls"] = "",
  xlam = "",
  xlsb = "",
  xlsm = "",
  xlsx = "",
  [".xlt"] = "",
  xltm = "",
  xltx = "",
  [".odp"] = "",
  [".pot"] = "",
  [".potm"] = "",
  [".potx"] = "",
  [".ppa"] = "",
  ppam = "",
  [".pps"] = "",
  [".ppsm"] = "",
  [".ppsx"] = "",
  [".ppt"] = "",
  pptm = "",
  pptx = "",
  [".ani"] = "",
  [".bmp"] = "",
  [".cur"] = "",
  [".emf"] = "",
  [".gif"] = "",
  [".ico"] = "",
  jpeg = "",
  [".jpg"] = "",
  [".png"] = "",
  [".raw"] = "",
  [".tif"] = "",
  tiff = "",
  [".wmf"] = "",
  [".3gp"] = "",
  [".aac"] = "",
  [".asf"] = "",
  [".avi"] = "",
  [".fla"] = "",
  flac = "",
  [".flv"] = "",
  [".m3u"] = "",
  [".m4v"] = "",
  [".mkv"] = "",
  [".mov"] = "",
  [".mp3"] = "",
  [".mp4"] = "",
  [".mpe"] = "",
  [".mpeg"] = "",
  [".mpg"] = "",
  [".ogg"] = "",
  [".vma"] = "",
  [".wav"] = "",
  [".wmv"] = "",
  [".cpp"] = "",
  [".css"] = "",
  [".csv"] = "",
  [".eml"] = "",
  gdoc = "",
  [".hta"] = "",
  [".htm"] = "",
  html = "",
  [".mht"] = "",
  [".pdf"] = "",
  [".php"] = "",
  [".ttf"] = "",
  [".xml"] = "",
  [".cab"] = "",
  gzip = "",
  [".iso"] = "",
  [".rar"] = "",
  [".tar"] = "",
  [".vhd"] = "",
  ["-3ds"] = "",
  acad = "",
  [".aws"] = "",
  [".dwg"] = "",
  [".dxf"] = "",
  [".fas"] = "",
  [".lsp"] = "",
  [".mnl"] = "",
  [".plf"] = "",
  [".vlx"] = ""
}
local l_0_2 = string.sub(l_0_0, -8)
if l_0_1[string.sub(l_0_2, 1, 4)] then
  mp.set_mpattribute("Lua:ContextLnkDoubleExtension")
end
return mp.CLEAN
