-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6a4_923.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((MpCommon.PathToWin32Path)((bm.get_imagepath)()))
if not (string.find)(l_0_0, "c:\\users\\", 1, true) and not (string.find)(l_0_0, "c:\\programdata\\", 1, true) and not (string.find)(l_0_0, "\\appdata\\local\\", 1, true) and not (string.find)(l_0_0, "\\kmspico\\", 1, true) then
  return mp.CLEAN
end
local l_0_1 = (MpCommon.GetPersistContextNoPath)("bm_uacbypass_connmgr")
if l_0_1 then
  for l_0_5,l_0_6 in ipairs(l_0_1) do
    local l_0_7, l_0_8 = (string.match)(l_0_6, "(.+);ImagePath:(.+)")
    if l_0_8 then
      l_0_8 = (MpCommon.PathToWin32Path)(l_0_8)
      if (sysio.IsFileExists)(l_0_8) then
        (bm.add_related_file)(l_0_8)
        l_0_6 = (string.gsub)(l_0_6, ",", "_")
        ;
        (bm.add_related_string)("PossibleTrigger", l_0_6, bm.RelatedStringBMReport)
      end
    end
  end
  return mp.INFECTED
end
return mp.CLEAN

