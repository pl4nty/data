-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\825d_289.luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil then
    local l_0_0 = (this_sigattrlog[1]).utf8p1
    ;
    (mp.TriggerScanResource)("file", l_0_0, 0)
    return mp.INFECTED
  end
  return mp.CLEAN
end

