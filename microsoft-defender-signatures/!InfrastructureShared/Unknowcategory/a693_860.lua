-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a693_860.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((MpCommon.PathToWin32Path)((bm.get_imagepath)()))
if not (string.find)(l_0_0, "^c:\\") and not (string.find)(l_0_0, "^\\\\") then
  return mp.CLEAN
end
local l_0_1 = (MpCommon.QueryPersistContext)(l_0_0, "ExecutedPENoCert")
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = (MpCommon.GetPersistContextNoPath)("bm_uacbypass_connmgr")
if l_0_2 then
  for l_0_6,l_0_7 in ipairs(l_0_2) do
    local l_0_8, l_0_9 = (string.match)(l_0_7, "(.+);ImagePath:(.+)")
    if l_0_9 then
      l_0_9 = (MpCommon.PathToWin32Path)(l_0_9)
      if (sysio.IsFileExists)(l_0_9) then
        (bm.add_related_file)(l_0_9)
        l_0_7 = (string.gsub)(l_0_7, ",", "_")
        ;
        (bm.add_related_string)("PossibleTrigger", l_0_7, bm.RelatedStringBMReport)
      end
    end
  end
  return mp.INFECTED
end
return mp.CLEAN

