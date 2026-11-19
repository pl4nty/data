-- Threat: !InfrastructureShared
-- Name: e7b3aca02c64
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[4].utf8p1)
  if l_0_0:find("\\windows nt\\", 1, true) then
    if not sysio.IsFileExists(l_0_0) then
      return mp.CLEAN
    end
    local l_0_1 = mp.IsKnownFriendlyFile(l_0_0, true, false)
    if l_0_1 ~= nil and l_0_1 == true then
      return mp.CLEAN
    end
    local l_0_2 = {
      [".dll"] = true,
      [".ocx"] = true
    }
    bm_AddRelatedFileFromCommandLine(l_0_0, l_0_2, nil, 6)
    return mp.INFECTED
  end
end
return mp.CLEAN
