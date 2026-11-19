-- Threat: !InfrastructureShared
-- Name: !#LUA:Script/VarbaseDecode.Z!MTB
-- Type: 13
-- MpAttributes: SCRIPT:NodeJS/require.fs & SCRIPT:PsConvertToBase64String.A & SCRIPT:NodeReqChildProc & Lua:JSExt

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = mp.getfilesize()
r0_0 = r0_0 > 153600 and 153600 or r0_0
mp.readprotection(false)
local r0_1 = tostring(mp.readfile(0, r0_0)) or ""
mp.readprotection(true)
if r0_1 == "" then
  return mp.CLEAN
end
local r0_2 = string.match(r0_1, "::FromBase64String%s*%(%s*[\"']%$%{([%w_]+)%}[\"']%s*%)")
if r0_2 then
  local r0_3 = "const%s+" .. r0_2 .. "%s*=%s*[\"']([A-Za-z0-9+/=\r\n]+)[\"']"
  local r0_4 = string.match(r0_1, r0_3)
  if r0_4 ~= nil and not (#r0_4 < 256) then
    local r0_5 = MpCommon.Base64Decode(r0_4)
    if r0_5 == nil then
      return mp.CLEAN
    end
    mp.vfo_add_buffer(r0_5, "[DecodedVFO]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
    return mp.CLEAN
  end
  return mp.CLEAN
end
return mp.CLEAN
