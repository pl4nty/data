-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanDownloaderJSChainLoadC\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 == nil or l_0_0 < 4096 or l_0_0 > 262144 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_1 = (mp.readfile)(0, l_0_0)
;
(mp.readprotection)(true)
if type(l_0_1) ~= "string" or #l_0_1 ~= l_0_0 then
  return mp.CLEAN
end
local l_0_2, l_0_3 = (string.match)(l_0_1, "eval%s*%(%s*atob%s*%(%s*([\'\"])([A-Za-z0-9+/=]+)%1%s*%)%s*%)")
if l_0_3 == nil or #l_0_3 < 4096 or #l_0_3 % 4 ~= 0 then
  return mp.CLEAN
end
if not (string.match)(l_0_3, "^[A-Za-z0-9+/]+=?=?$") then
  return mp.CLEAN
end
local l_0_4, l_0_5 = pcall(MpCommon.Base64Decode, l_0_3)
if not l_0_4 or type(l_0_5) ~= "string" then
  return mp.CLEAN
end
local l_0_6 = (string.lower)(l_0_5)
do
  local l_0_7 = {}
  -- DECOMPILER ERROR at PC92: No list found for R7 , SetList fails

  -- DECOMPILER ERROR at PC93: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC94: Overwrote pending register: R9 in 'AssignReg'

  for l_0_11,l_0_12 in ("eth_get")("txlist") do
    -- DECOMPILER ERROR at PC97: Overwrote pending register: R13 in 'AssignReg'

    -- DECOMPILER ERROR at PC99: Overwrote pending register: R14 in 'AssignReg'

    -- DECOMPILER ERROR at PC100: Overwrote pending register: R15 in 'AssignReg'

    -- DECOMPILER ERROR at PC101: Overwrote pending register: R16 in 'AssignReg'

    if not (("stdin").find)("windowshide", "detached", "charcodeat", true) then
      return mp.CLEAN
    end
  end
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

