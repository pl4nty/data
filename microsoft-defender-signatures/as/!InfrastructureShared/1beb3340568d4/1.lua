-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1beb3340568d4\1.luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[9]).matched and (this_sigattrlog[9]).utf8p2 ~= nil then
    local l_0_0 = ((this_sigattrlog[9]).utf8p2):match("filepath:(.+)")
    if l_0_0 == nil or l_0_0 == "" then
      return mp.CLEAN
    end
    ;
    (bm.add_threat_file)(l_0_0)
    AddResearchData("BM", true)
    return mp.INFECTED
  end
  return mp.CLEAN
end

