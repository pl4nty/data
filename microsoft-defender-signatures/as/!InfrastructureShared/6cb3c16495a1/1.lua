-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6cb3c16495a1\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 then
  local l_0_0 = safeJsonDeserialize((this_sigattrlog[2]).utf8p2)
  if not isnull(l_0_0) and not isnull(l_0_0.rename_ext) then
    local l_0_1 = (l_0_0.rename_ext):lower()
    local l_0_2 = {}
    l_0_2[".loop"] = true
    if l_0_2[l_0_1] == true then
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

