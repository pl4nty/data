-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\62b3dc02ff1e\1.luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[2]).matched then
    local l_0_0 = (this_sigattrlog[2]).utf8p1
    if l_0_0 ~= nil and (string.find)(l_0_0, "package.json", -12, true) and (string.find)(l_0_0, "/node_modules/", 1, true) then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

