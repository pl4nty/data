-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#BM_OfficeFilesFromArchives\0x0000068f_luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_1 == nil or #l_0_1 < 4 then
  return mp.CLEAN
end
local l_0_2 = l_0_1:match("%.([^%.]+)$")
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = {}
l_0_3.xlsx = true
l_0_3.xls = true
l_0_3.xlsm = true
l_0_3.xlsb = true
l_0_3.xlt = true
l_0_3.xltx = true
l_0_3.xltm = true
l_0_3.xlam = true
l_0_3.xla = true
l_0_3.docx = true
l_0_3.doc = true
l_0_3.docm = true
l_0_3.dotm = true
l_0_3.dotx = true
l_0_3.ppam = true
l_0_3.pptm = true
l_0_3.ppsm = true
l_0_3.potm = true
l_0_3.ppt = true
l_0_3.pptx = true
l_0_3.rtf = true
l_0_3.one = true
l_0_3[".onetoc2"] = true
local l_0_4 = {}
l_0_4.iso = true
l_0_4.vhd = true
l_0_4.vhdx = true
l_0_4.ppkg = true
l_0_4.sppkg = true
l_0_4.img = true
local l_0_5 = nil
if l_0_4[l_0_2] then
  l_0_5 = "iso|"
else
  if l_0_3[l_0_2] and (mp.get_mpattribute)("MHSTR:MacroInside") then
    l_0_5 = "office|HasMacros|"
  end
end
do return mp.CLEAN end
local l_0_6 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
local l_0_7 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
l_0_6 = (MpCommon.PathToWin32Path)(l_0_6)
if l_0_6 == nil or l_0_7 == nil then
  return mp.CLEAN
end
l_0_6 = l_0_6:lower()
local l_0_8, l_0_9, l_0_10 = nil, nil, nil
local l_0_11 = ";"
local l_0_12 = 0
while 1 do
  if l_0_12 <= 5 then
    l_0_8 = pcall(mp.GetParentProcInfo, l_0_7)
  end
  if l_0_8 == true and l_0_9 ~= nil and l_0_9.ppid ~= nil then
    if l_0_9.image_path == nil then
      break
    end
    l_0_7 = l_0_9.ppid
    l_0_10 = (string.lower)(l_0_9.image_path)
    l_0_11 = l_0_11 .. "Parent_" .. l_0_12 .. "Path=" .. l_0_10 .. ";pid=" .. l_0_7 .. ";"
    l_0_12 = l_0_12 + 1
    -- DECOMPILER ERROR at PC148: LeaveBlock: unexpected jumping out IF_THEN_STMT

    -- DECOMPILER ERROR at PC148: LeaveBlock: unexpected jumping out IF_STMT

  end
end
local l_0_13 = (MpCommon.GetCurrentTimeT)()
local l_0_14 = 31536000
local l_0_15 = l_0_0 .. "\\" .. l_0_1
local l_0_16 = "OFFAR::ProcessImagePath=" .. l_0_6 .. ";pid=" .. l_0_7 .. ";timestamp=" .. l_0_13 .. l_0_11
if l_0_5 ~= nil then
  l_0_16 = l_0_16 .. ";extra=" .. l_0_5
end
if not IsKeyInRollingQueue("CC_filelist", l_0_15) then
  AppendToRollingQueue("CC_filelist", l_0_15, l_0_16, l_0_14, 32)
  ;
  (mp.set_mpattribute)((string.format)("MpInternal_researchdata=CC_Research=%s", l_0_16))
end
return mp.INFECTED

