-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e7b3aca02c64\1_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil then
  local l_0_0 = (string.lower)((this_sigattrlog[4]).utf8p1)
  if l_0_0:find("\\windows nt\\", 1, true) then
    if not (sysio.IsFileExists)(l_0_0) then
      return mp.CLEAN
    end
    local l_0_1 = (mp.IsKnownFriendlyFile)(l_0_0, true, false)
    if l_0_1 ~= nil and l_0_1 == true then
      return mp.CLEAN
    end
    local l_0_2 = {}
    l_0_2[".dll"] = true
    l_0_2[".ocx"] = true
    bm_AddRelatedFileFromCommandLine(l_0_0, l_0_2, nil, 6)
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

