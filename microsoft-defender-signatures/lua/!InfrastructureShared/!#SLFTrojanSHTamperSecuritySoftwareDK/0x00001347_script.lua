-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanSHTamperSecuritySoftwareDK\0x00001347_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 == nil or l_0_0 >= 20480 then
  return mp.CLEAN
end
local l_0_1 = (mp.enum_mpattributesubstring)("SCPT:SuspiciousShell_mdatp_")
if l_0_1 == nil or #l_0_1 == 0 then
  return mp.CLEAN
end
local l_0_2 = (mp.enum_mpattributesubstring)("SCPT:SuspiciousShell_carbonblack_removal_")
if l_0_2 == nil or #l_0_2 == 0 then
  return mp.CLEAN
end
local l_0_3 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_3 == nil or l_0_3 == "" or l_0_3 == "/root/.bash_history" then
  return mp.CLEAN
end
return mp.INFECTED

