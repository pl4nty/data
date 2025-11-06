-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1d5b3cec78c44\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = (string.lower)((MpCommon.PathToWin32Path)(l_0_0))
local l_0_1 = (string.lower)((MpCommon.ExpandEnvironmentVariables)("%WINDIR%\\SYSTEM32\\"))
if not l_0_0:find(l_0_1, 1, true) then
  return mp.CLEAN
end
local l_0_2 = {}
l_0_2["srdelayed.exe"] = true
l_0_2["poqexec.exe"] = true
l_0_2["setupcl.exe"] = true
l_0_2["register-cimprovider2.exe"] = true
l_0_2["msiexec.exe"] = true
local l_0_3 = (MpCommon.GetOriginalFileName)(l_0_0)
if l_0_3 ~= "" and l_0_3 ~= nil then
  (bm.add_related_string)("OriginalFileName", l_0_3, bm.RelatedStringBMReport)
  if l_0_2[l_0_3] then
    return mp.CLEAN
  end
  return mp.INFECTED
end
if (mp.IsKnownFriendlyFile)(l_0_0, true, false) == false then
  (bm.add_related_string)("FriendlyFile", "false", bm.RelatedStringBMReport)
end
local l_0_4 = (MpCommon.GetOriginalFileName)(l_0_0)
do
  if not l_0_4 then
    local l_0_5 = (sysio.GetPEVersionInfo)(l_0_0)
    if not l_0_5 or not l_0_5.OriginalFilename or l_0_5.OriginalFilename == "" then
      (bm.add_related_string)("OriginalFileName_PeParser", "null", bm.RelatedStringBMReport)
      return mp.INFECTED
    end
    l_0_4 = l_0_5.OriginalFilenam
  end
  ;
  (MpCommon.SetOriginalFileName)(l_0_0, l_0_4)
  ;
  (bm.add_related_string)("OriginalFileName_PeParser", l_0_4, bm.RelatedStringBMReport)
  if l_0_2[(string.lower)(l_0_4)] then
    return mp.CLEAN
  end
  return mp.INFECTED
end

