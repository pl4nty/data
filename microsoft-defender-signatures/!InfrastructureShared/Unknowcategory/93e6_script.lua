-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\93e6_luac 

-- params : ...
-- function num : 0
do
  if (mp.get_mpattribute)("pea_no_security") and peattributes.isdll == true and peattributes.hasexports and peattributes.no_imports then
    local l_0_0 = (mp.getfilesize)()
    if l_0_0 >= 80000 and l_0_0 <= 250000 then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

