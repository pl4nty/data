-- Threat: !InfrastructureShared
-- Name: !#ALF:DoubleExtension
-- Type: 13
-- MpAttributes: BM_MZ_FILE & MpNewlyCreatedHint & RPF:TopLevelFile

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if string.find(l_0_0, "tsv_to_xlsx.exe", 1, true) or string.find(l_0_0, "pypdf2docx.exe", 1, true) then
  return mp.CLEAN
end
local l_0_1 = {
  [".doc.exe"] = "",
  ["docx.exe"] = "",
  ["docm.exe"] = "",
  [".xls.exe"] = "",
  ["xlsx.exe"] = "",
  [".ppt.exe"] = "",
  ["pptx.exe"] = "",
  [".rtf.exe"] = "",
  [".pdf.exe"] = "",
  [".txt.exe"] = "",
  [".rar.exe"] = "",
  [".zip.exe"] = "",
  ["    .exe"] = "",
  ["____.exe"] = "",
  ["rar.exe"] = "",
  ["doc.exe"] = "",
  ["xls.exe"] = "",
  ["pdf.exe"] = "",
  ["txt.exe"] = "",
  ["zip.exe"] = "",
  [".docx.js"] = "",
  [".xlsx.js"] = "",
  [".pptx.js"] = "",
  [".doc.js"] = "",
  [".ppt.js"] = "",
  [".xls.js"] = "",
  [".pdf.js"] = "",
  [".txt.js"] = ""
}
local l_0_2 = l_0_0:sub(-8)
local l_0_3 = l_0_2:sub(-7)
if l_0_1[l_0_3] ~= nil or l_0_1[l_0_2] ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
