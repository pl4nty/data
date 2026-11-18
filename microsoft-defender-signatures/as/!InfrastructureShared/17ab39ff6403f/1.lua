-- Threat: !InfrastructureShared
-- Name: 17ab39ff6403f
-- Type: 21

local l_0_0 = 0
local l_0_1 = ""
if this_sigattrlog[2].matched then
  if this_sigattrlog[2].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[2].utf8p2
  end
elseif this_sigattrlog[3].matched then
  if this_sigattrlog[3].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[3].utf8p2
  end
elseif this_sigattrlog[4].matched then
  if this_sigattrlog[4].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[4].utf8p2
  end
elseif this_sigattrlog[5].matched then
  if this_sigattrlog[5].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[5].utf8p2
  end
elseif this_sigattrlog[6].matched then
  if this_sigattrlog[6].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[6].utf8p2
  end
elseif this_sigattrlog[7].matched then
  if this_sigattrlog[7].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[7].utf8p2
  end
elseif this_sigattrlog[8].matched then
  if this_sigattrlog[8].utf8p2 ~= nil then
    l_0_1 = this_sigattrlog[8].utf8p2
  end
elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[9].utf8p2
end
if l_0_1 ~= nil then
  local l_0_2 = string.match(l_0_1, ".:\\.*\\")
  local l_0_3 = {
    "nss3.dll",
    "msvcp140.dll",
    "vcruntime140.dll",
    "mozglue.dll",
    "freebl3.dll",
    "softokn3.dll",
    "sqlite3.dll",
    "nssdbm3.dll"
  }
  local l_0_4 = #l_0_3
  local l_0_5 = ""
  for l_0_6 = 1, l_0_4 do
    l_0_5 = l_0_2 .. l_0_3[l_0_6]
    if sysio.IsFileExists(l_0_5) then
      l_0_0 = l_0_0 + 1
    end
  end
end
if 5 < l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
