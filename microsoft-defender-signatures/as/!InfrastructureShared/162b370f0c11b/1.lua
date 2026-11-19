-- Threat: !InfrastructureShared
-- Name: 162b370f0c11b
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil and this_sigattrlog[4].utf8p2 ~= nil then
  local l_0_2 = string.lower(this_sigattrlog[4].utf8p1)
  l_0_1 = l_0_2:match("software\\classes\\%.([^\\]+)")
  l_0_0 = string.lower(this_sigattrlog[4].utf8p2)
end
if l_0_1 == nil or #l_0_1 < 4 then
  return mp.CLEAN
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_3
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_3 = string.lower(this_sigattrlog[3].utf8p1)
end
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4, l_0_5, l_0_6
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_4 = string.lower(this_sigattrlog[5].utf8p1)
  l_0_5 = this_sigattrlog[5].utf8p2
  for l_0_7 in l_0_5:gmatch("%.[gG][eE][tT][sS][tT][rR][iI][nN][gG].+[Ff][Rr][Oo][Mm][Bb][Aa][Ss][Ee]64[Ss][Tt][Rr][Ii][Nn][Gg]%s*%(%s*['\"]?(.-)['\"]?%s*%)") do
    if l_0_7 then
      l_0_7 = string.gsub(l_0_7, " ", "")
      l_0_7 = string.gsub(l_0_7, "['\"]%+['\"]", "")
      local l_0_8 = MpCommon.Base64Decode(l_0_7)
      if l_0_8 ~= nil and l_0_8 ~= "" then
        l_0_6 = l_0_8:match("\\([^\\]+)$")
      end
    end
  end
end
if l_0_6 == nil then
  return mp.CLEAN
else
  l_0_6 = string.lower(l_0_6)
end
local l_0_9
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_9 = this_sigattrlog[2].utf8p1
end
if l_0_3:find(l_0_6, 1, true) or l_0_3:find(l_0_1, 1, true) or l_0_4:find(l_0_0, 1, true) then
  if l_0_9 ~= nil and sysio.IsFileExists(l_0_9) then
    bm.add_threat_file(l_0_9)
  end
  if sysio.IsFileExists(l_0_3) then
    bm.add_threat_file(l_0_9)
  end
  return mp.INFECTED
end
return mp.CLEAN
