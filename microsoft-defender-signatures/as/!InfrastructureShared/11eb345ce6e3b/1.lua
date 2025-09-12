-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\11eb345ce6e3b\1.luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 then
    local l_0_0 = (string.lower)((this_sigattrlog[2]).utf8p1)
    if l_0_0 == nil then
      return mp.CLEAN
    end
    if (mp.IsKnownFriendlyFile)(l_0_0, true, false) then
      return mp.CLEAN
    end
    ;
    (bm.add_threat_file)(l_0_0)
    return mp.INFECTED
  end
  return mp.CLEAN
end

