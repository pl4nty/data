-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFBackdoorWin32FrostByteLU!dha\1.luac 

-- params : ...
-- function num : 0
if not peattributes.isdll then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilesize)()
if l_0_0 < 5184000 then
  return mp.CLEAN
end
local l_0_1 = (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_FILEPATH))
if (string.find)(l_0_1, "\\temp", 1, true) == nil then
  return mp.CLEAN
end
local l_0_2, l_0_3 = (pe.get_exports)()
if l_0_2 > 2 then
  return mp.CLEAN
end
local l_0_4 = (pe.get_versioninfo)()
if l_0_4 ~= nil then
  if l_0_4.CompanyName ~= "TODO" then
    return mp.CLEAN
  end
  if l_0_4.OriginalFilename ~= "COM.dll" then
    return mp.CLEAN
  end
end
return mp.INFECTED

