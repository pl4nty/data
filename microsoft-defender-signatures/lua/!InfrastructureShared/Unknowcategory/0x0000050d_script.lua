-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x0000050d_luac 

-- params : ...
-- function num : 0
if (mp.get_sigattr_event_count)(16384) > 50 then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((bm.get_imagepath)())
if l_0_0:find("\\netwrix auditor\\active directory auditing\\", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED

