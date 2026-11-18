-- Threat: Trojan:Script/GhStealer.A
-- Type: 13
-- MpAttributes: SCRIPT:StringBase64.A & (Lua:YAMLExt | Lua:YMLExt)

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = mp.getfilesize()
r0_0 = r0_0 > 153600 and 153600 or r0_0
mp.readprotection(false)
local r0_1 = tostring(mp.readfile(0, r0_0)) or ""
mp.readprotection(true)
if r0_1 == "" then
  return mp.CLEAN
end
local r0_2 = string.match(r0_1, 'set%s+[+-]e[%s;]+echo%s+"([A-Za-z0-9+/=\r\n]+)"%s*|%s*base64%s+%-d')
if r0_2 ~= nil and not (#r0_2 < 512) then
  local r0_3 = MpCommon.Base64Decode(r0_2)
  if r0_3 == nil then
    return mp.CLEAN
  end
  mp.vfo_add_buffer(r0_3, "[DecodedVFO]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
  local r0_4 = string.lower(r0_3)
  r0_3 = r0_4
  r0_4 = {
    "megalodon", "gh_dump", "gcp_access_token", "x%-mega%-did", "x%-mega%-plat",
    "/proc/%*%*/environ", "169%.254%.169%.254", "aws%s+sts%s+get%-caller%-identity",
    "gcloud%s+auth%s+print%-access%-token", "grep%s+%-rile"
  }
  local r0_5 = 0
  for r0_6, r0_7 in ipairs(r0_4) do
    if string.find(r0_3, r0_7) then
      r0_5 = r0_5 + 1
      if r0_5 >= 2 then
        return mp.INFECTED
      end
    end
  end
  return mp.CLEAN
end
return mp.CLEAN
