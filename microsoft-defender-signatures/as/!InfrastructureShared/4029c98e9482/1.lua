-- Threat: !InfrastructureShared
-- Name: 4029c98e9482
-- Type: 21

if not mp.get_mpattribute("MpIsPowerShellAMSIScan") then
  return mp.CLEAN
end
local l_0_0 = mp.GetBruteMatchData()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = ""
if l_0_0.is_header then
  l_0_1 = string.lower(tostring(headerpage))
else
  l_0_1 = string.lower(tostring(footerpage))
end
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = {
  ["4.149.115.16/28"] = true,
  ["4.190.130.32/28"] = true,
  ["4.194.226.160/27"] = true,
  ["4.208.13.0/24"] = true,
  ["13.83.125.0/24"] = true,
  ["20.8.195.0/24"] = true,
  ["20.10.127.0/24"] = true,
  ["20.15.141.0/24"] = true,
  ["20.18.4.160/28"] = true,
  ["20.19.31.144/28"] = true,
  ["20.26.63.224/28"] = true,
  ["20.91.96.64/28"] = true,
  ["20.91.149.32/28"] = true,
  ["20.175.2.208/28"] = true,
  ["20.199.204.160/28"] = true,
  ["20.204.195.240/28"] = true,
  ["20.208.150.16/28"] = true,
  ["20.211.228.80/28"] = true,
  ["20.220.2.112/28"] = true,
  ["20.226.211.64/28"] = true,
  ["20.242.181.0/24"] = true,
  ["20.254.173.48/28"] = true,
  ["40.80.103.192/28"] = true,
  ["52.172.85.0/28"] = true,
  ["68.218.120.64/28"] = true
}
local l_0_3 = "new-netroute.*\\-destinationprefix[\\s\"']+(\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\/\\d{1,2})[\\s\"']+"
local l_0_4, l_0_5 = MpCommon.StringRegExpSearch(l_0_3, l_0_1)
if l_0_4 and l_0_5 and l_0_2[l_0_5] then
  return mp.INFECTED
end
return mp.CLEAN
