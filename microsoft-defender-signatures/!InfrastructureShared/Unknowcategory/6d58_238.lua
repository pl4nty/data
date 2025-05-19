-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6d58_238.luac 

-- params : ...
-- function num : 0
local l_0_0 = (pe.get_versioninfo)()
if l_0_0.OriginalFilename ~= nil and (l_0_0.OriginalFilename):lower() == "schedctl.dll" then
  return mp.INFECTED
end
return mp.CLEAN

