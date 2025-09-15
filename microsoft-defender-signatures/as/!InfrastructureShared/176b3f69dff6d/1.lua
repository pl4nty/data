-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\176b3f69dff6d\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
do
  if l_0_0 ~= nil and l_0_0 ~= "" and l_0_0:lower() == "0dde20f2-5621-4cfa-b3f5-b920800dd3b4" then
    local l_0_1, l_0_2, l_0_3, l_0_4, l_0_5, l_0_6 = nil, nil, nil, nil, nil, nil
    if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p1 ~= nil then
      l_0_1 = (this_sigattrlog[6]).utf8p1
    end
    if (this_sigattrlog[7]).matched and (this_sigattrlog[7]).utf8p1 ~= nil then
      l_0_2 = (this_sigattrlog[7]).utf8p1
    end
    if (this_sigattrlog[8]).matched and (this_sigattrlog[8]).utf8p1 ~= nil then
      l_0_3 = (this_sigattrlog[8]).utf8p1
    end
    if (this_sigattrlog[9]).matched and (this_sigattrlog[9]).utf8p1 ~= nil then
      l_0_4 = (this_sigattrlog[9]).utf8p1
    end
    if (this_sigattrlog[10]).matched and (this_sigattrlog[10]).utf8p1 ~= nil then
      l_0_5 = (this_sigattrlog[10]).utf8p1
    end
    if (this_sigattrlog[11]).matched and (this_sigattrlog[11]).utf8p1 ~= nil then
      l_0_6 = (this_sigattrlog[11]).utf8p1
    end
    if l_0_1 ~= nil and l_0_1 == l_0_2 and l_0_2 == l_0_3 and l_0_3 == l_0_4 and l_0_4 == l_0_5 and l_0_5 == l_0_6 then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

