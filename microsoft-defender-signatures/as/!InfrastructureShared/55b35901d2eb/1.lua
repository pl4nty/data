-- Threat: !InfrastructureShared
-- Name: 55b35901d2eb
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p1
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = string.lower(this_sigattrlog[4].utf8p1)
local l_0_2 = {
  "/firefox$",
  "/safari$",
  "/mobilesafari$",
  "/safariviewservice$"
}
local l_0_3 = {
  "^/users/.+/library/safari/persitepreferences%.db$",
  "^/users/.+/library/safari/usermediapermissions%.plist$",
  "^/users/.+/library/application support/firefox/.+/permissions%.sqlite$"
}
for l_0_4, l_0_5 in ipairs(l_0_2) do
  if string.find(l_0_1, l_0_5) then
    return mp.CLEAN
  end
end
for l_0_6, l_0_7 in ipairs(l_0_3) do
  if string.find(l_0_0, l_0_7) then
    return mp.INFECTED
  end
end
return mp.CLEAN
