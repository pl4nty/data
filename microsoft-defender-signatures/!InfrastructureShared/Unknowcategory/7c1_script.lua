-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7c1_luac 

-- params : ...
-- function num : 0
local l_0_1 = nil
do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).wp1 ~= nil then
    local l_0_0, l_0_2 = (mp.ContextualExpandEnvironmentVariables)((this_sigattrlog[2]).utf8p1), nil
    ;
    (bm.add_related_file)(l_0_0)
  end
  do
    if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).wp1 ~= nil then
      local l_0_3 = nil
      ;
      (bm.add_related_file)((mp.ContextualExpandEnvironmentVariables)((this_sigattrlog[3]).utf8p1))
    end
    return mp.INFECTED
  end
end

