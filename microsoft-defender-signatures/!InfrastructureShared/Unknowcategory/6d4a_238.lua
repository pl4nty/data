-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6d4a_238.luac 

-- params : ...
-- function num : 0
if (string.find)((string.lower)((mp.getfilename)()), "%-%>%[cmdembedded%]$") == nil then
  return mp.CLEAN
end
return mp.INFECTED

