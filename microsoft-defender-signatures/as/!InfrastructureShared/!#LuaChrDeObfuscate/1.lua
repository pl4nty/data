-- Threat: !InfrastructureShared
-- Name: !#Lua:ChrDeObfuscate
-- Type: 13
-- MpAttributes: SCRIPT:ChrObfus

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

if mp.get_mpattribute("SCRIPT:ChrObfus!filter") then
  local r0_0 = mp.getfilesize()
  if r0_0 > 24576 then
    return mp.CLEAN
  end
  mp.readprotection(false)
  local r0_1 = mp.readfile(0, r0_0)
  local r0_2 = 0
  local r0_3, r0_4 = string.gsub(r0_1, '"&Chr%((%d%d)%)',
    function(p1_0)
      return string.char(p1_0)
    end)
  r0_2 = r0_2 + r0_4
  r0_3, r0_4 = string.gsub(r0_3, "&Chr%((%d%d)%)",
    function(p2_0)
      return string.char(p2_0)
    end)
  r0_2 = r0_2 + r0_4
  r0_3, r0_4 = string.gsub(r0_3, "Chr%((%d%d)%)",
    function(p3_0)
      return string.char(p3_0)
    end)
  if r0_2 + r0_4 > 300 then
    local r0_5 = string.gsub(r0_3, [[ _
]], "")
    local r0_6 = string.gsub(r0_5, '([%w%s])"&"', "%1")
    r0_5 = r0_6
    r0_6 = string.gsub
    local r0_7 = r0_5
    r0_6 = r0_6(r0_7, '&"', "")
    r0_5 = r0_6
    r0_6 = string.gsub
    r0_7 = r0_5
    r0_6 = r0_6(r0_7, '"&', "")
    r0_5 = r0_6
    r0_6 = mp.vfo_add_buffer
    r0_7 = r0_5
    r0_6(r0_7, "[deobfus]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
  end
end
return mp.CLEAN
