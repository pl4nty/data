-- Threat: !InfrastructureShared
-- Name: !#RoxstageFileEvals
-- Type: 13
-- MpAttributes: !BM_MZ_FILE & RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILE_AGE)
if l_0_0 ~= nil and l_0_0 <= 7200 then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
local l_0_3 = MpCommon.PathToWin32Path(l_0_2)
if l_0_3 == nil then
  return mp.CLEAN
end
l_0_3 = l_0_3 .. "\\" .. l_0_1
if not MpCommon.QueryPersistContext(l_0_3, "BM_RoxstageProcessEval") then
  return mp.CLEAN
end
if MpCommon.QueryPersistContext(l_0_3, "BM_RoxstageProcessBlock") then
  return mp.CLEAN
end
local l_0_4 = {
  [".pdf"] = true,
  [".doc"] = true,
  [".docx"] = true,
  [".docm"] = true,
  [".xls"] = true,
  [".xlsx"] = true,
  [".xlsm"] = true,
  [".ppt"] = true,
  [".pptx"] = true,
  [".pptm"] = true
}
local l_0_5 = {
  [".txt"] = true,
  [".bat"] = true,
  [".cmd"] = true,
  [".ps1"] = true,
  [".vbs"] = true,
  [".wsf"] = true,
  [".js"] = true,
  [".html"] = true,
  [".htm"] = true,
  [".hta"] = true,
  [".xml"] = true
}
local l_0_6 = {
  [".zip"] = true,
  [".rar"] = true,
  [".7z"] = true,
  [".gzip"] = true
}
local l_0_7 = {
  [".jpeg"] = true,
  [".jpg"] = true,
  [".jpe"] = true,
  [".png"] = true,
  [".bmp"] = true
}
local l_0_8 = {
  [".webm"] = true,
  [".mkv"] = true,
  [".flv"] = true,
  [".vob"] = true,
  [".ogv"] = true,
  [".ogg"] = true,
  [".drc"] = true,
  [".gif"] = true,
  [".gifv"] = true,
  [".mng"] = true,
  [".avi"] = true,
  [".mts"] = true,
  [".m2ts"] = true,
  [".ts"] = true,
  [".mov"] = true,
  [".qt"] = true,
  [".wmv"] = true,
  [".yuv"] = true,
  [".rm"] = true,
  [".rmvb"] = true,
  [".asf"] = true,
  [".amv"] = true,
  [".mp4"] = true,
  [".m4p"] = true,
  [".m4v"] = true,
  [".mpg"] = true,
  [".mpeg"] = true,
  [".mp2"] = true,
  [".mpe"] = true,
  [".mpv"] = true,
  [".m2v"] = true,
  [".f4v"] = true,
  [".f4p"] = true,
  [".f4a"] = true,
  [".f4b"] = true
}
local l_0_9 = {
  [".3gp"] = true,
  [".aa"] = true,
  [".aac"] = true,
  [".aax"] = true,
  [".act"] = true,
  [".aiff"] = true,
  [".alac"] = true,
  [".amr"] = true,
  [".ape"] = true,
  [".au"] = true,
  [".awb"] = true,
  [".dct"] = true,
  [".dss"] = true,
  [".dvf"] = true,
  [".flac"] = true,
  [".gsm"] = true,
  [".iklax"] = true,
  [".ivs"] = true,
  [".m4a"] = true,
  [".m4b"] = true,
  [".m4p"] = true,
  [".mmf"] = true,
  [".mp3"] = true,
  [".mpc"] = true,
  [".msv"] = true,
  [".nmf "] = true,
  [".nsf"] = true,
  [".ogg"] = true,
  [".oga"] = true,
  [".mogg"] = true,
  [".opus"] = true,
  [".ra"] = true,
  [".rm"] = true,
  [".raw"] = true,
  [".sln"] = true,
  [".tta"] = true,
  [".voc"] = true,
  [".vox"] = true,
  [".wav"] = true,
  [".wma"] = true,
  [".wv"] = true,
  [".8svx"] = true
}
local l_0_10 = {
  [".lnk"] = true,
  [".rtf"] = true
}
local l_0_11 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_12 = string.match(l_0_11, "(%.[^%.]+)$")
if l_0_12 == nil or l_0_12 == "" then
  return mp.CLEAN
end
if l_0_4[l_0_12] ~= true and l_0_5[l_0_12] ~= true and l_0_6[l_0_12] ~= true and l_0_7[l_0_12] ~= true and l_0_8[l_0_12] ~= true and l_0_9[l_0_12] ~= true and l_0_10[l_0_12] ~= true then
  return mp.CLEAN
end
local l_0_13 = mp.ContextualExpandEnvironmentVariables("%userprofile%")
l_0_13 = (l_0_13 == nil and "" or l_0_13):lower()
local l_0_14 = MpCommon.ExpandEnvironmentVariables("%public%")
l_0_14 = (l_0_14 == nil and "" or l_0_14):lower()
local l_0_15 = string.lower(MpCommon.PathToWin32Path(l_0_11))
if string.find(l_0_15, l_0_13 .. "\\documents\\", 1, true) == nil and string.find(l_0_15, l_0_14 .. "\\documents\\", 1, true) == nil and string.find(l_0_15, l_0_13 .. "\\pictures\\", 1, true) == nil and string.find(l_0_15, l_0_14 .. "\\pictures\\", 1, true) == nil and string.find(l_0_15, l_0_13 .. "\\videos\\", 1, true) == nil and string.find(l_0_15, l_0_14 .. "\\videos\\", 1, true) == nil and string.find(l_0_15, l_0_13 .. "\\music\\", 1, true) == nil and string.find(l_0_15, l_0_14 .. "\\music\\", 1, true) == nil and string.find(l_0_15, l_0_13 .. "\\favorites\\", 1, true) == nil and string.find(l_0_15, l_0_14 .. "\\favorites\\", 1, true) == nil and string.find(l_0_15, l_0_13 .. "\\desktop\\", 1, true) == nil and string.find(l_0_15, l_0_14 .. "\\desktop\\", 1, true) == nil and string.find(l_0_15, "c:\\demo\\", 1, true) == nil then
  return mp.CLEAN
end
local l_0_16 = {}
local l_0_17 = {}
local l_0_18 = false
local l_0_19 = 0
local l_0_20 = 0
local l_0_21 = MpCommon.GetPersistContext(l_0_3)
if l_0_21 == nil then
  return mp.CLEAN
end
for l_0_22, l_0_23 in ipairs(l_0_21) do
  local l_0_24 = string.match(l_0_23, "^RoxstageFile:(.+)$")
  if l_0_24 ~= nil then
    l_0_20 = l_0_20 + 1
    table.insert(l_0_17, "RoxstageFile:" .. l_0_24)
    if not sysio.IsFileExists(l_0_24) then
      l_0_19 = l_0_19 + 1
    end
    if l_0_24 == l_0_11 then
      l_0_18 = true
    end
  else
    table.insert(l_0_16, l_0_23)
  end
end
if l_0_18 == false then
  if 30 <= l_0_20 then
    l_0_17 = {}
  end
  table.insert(l_0_17, "RoxstageFile:" .. l_0_11)
end
if 21 <= l_0_19 then
  MpCommon.SetPersistContext(l_0_3, l_0_16, 0)
  if not MpCommon.QueryPersistContext(l_0_3, "BM_RoxstageProcessBlock") then
    MpCommon.AppendPersistContext(l_0_3, "BM_RoxstageProcessBlock", 0)
  end
  mp.set_mpattribute("BM_RoxstageProcessBlock")
  mp.ReportLowfi(l_0_3, 4007353695)
else
  for l_0_25, l_0_26 in ipairs(l_0_17) do
    table.insert(l_0_16, l_0_26)
  end
  MpCommon.SetPersistContext(l_0_3, l_0_16, 0)
end
return mp.CLEAN
