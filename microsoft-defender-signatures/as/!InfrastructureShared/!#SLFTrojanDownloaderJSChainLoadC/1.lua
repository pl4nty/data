-- Threat: !InfrastructureShared
-- Name: !#SLF:TrojanDownloader:JS/ChainLoad.C
-- Type: 13
-- MpAttributes: SCPT:ChainLoad.EncodedRoute

local l_0_0 = mp.getfilesize()
if l_0_0 == nil or l_0_0 < 4096 or 262144 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
mp.readprotection(true)
if type(l_0_1) ~= "string" or #l_0_1 ~= l_0_0 then
  return mp.CLEAN
end
local l_0_2, l_0_3 = string.match(l_0_1, "eval%s*%(%s*atob%s*%(%s*(['\"])([A-Za-z0-9+/=]+)%1%s*%)%s*%)")
if l_0_3 == nil or #l_0_3 < 4096 or #l_0_3 % 4 ~= 0 then
  return mp.CLEAN
end
if not string.match(l_0_3, "^[A-Za-z0-9+/]+=?=?$") then
  return mp.CLEAN
end
local l_0_4, l_0_5 = pcall(MpCommon.Base64Decode, l_0_3)
if not l_0_4 or type(l_0_5) ~= "string" then
  return mp.CLEAN
end
local l_0_6 = string.lower(l_0_5)
local l_0_7 = {
  "eth_get",
  "txlist",
  "/0x/cls",
  "/0x/ls",
  "spawn",
  "stdin",
  "windowshide",
  "detached",
  "charcodeat"
}
for l_0_8, l_0_9 in ipairs(l_0_7) do
  if not string.find(l_0_6, l_0_9, 1, true) then
    return mp.CLEAN
  end
end
return mp.INFECTED
