-- Threat: !InfrastructureShared
-- Name: 177b3fdb445b1
-- Type: 21
-- Includes: LuaFuncHelper, BMLuaLib

local l_0_0
local l_0_1 = ""
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1]
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2]
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3]
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4]
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[5]
end
if not l_0_0 then
  return mp.CLEAN
end
local l_0_2 = "DataExfilCreatedFile"
for l_0_3 = 1, mp.SIGATTR_LOG_SZ do
  if sigattr_head[l_0_3].matched and sigattr_head[l_0_3].attribute == 16384 and sigattr_head[l_0_3].utf8p1 then
    l_0_1 = string.lower(sigattr_head[l_0_3].utf8p1)
    local l_0_4 = string.match(l_0_1, "(%.[^%.]+)$")
    if contains(l_0_4, {
      ".zip",
      ".7z",
      ".rar",
      ".z",
      ".arj",
      ".tar",
      ".gz",
      ".tar.gz",
      ".s7z",
      ".ace",
      ".rk",
      ".gz",
      ".lz",
      ".zipx",
      ".bz2"
    }) then
      AppendToRollingQueue("DataComTrack", l_0_2, l_0_1)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
