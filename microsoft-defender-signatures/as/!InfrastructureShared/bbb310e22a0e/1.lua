-- Threat: !InfrastructureShared
-- Name: bbb310e22a0e
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = GetTaintLevelHR()
if r0_0 ~= "Medium" and r0_0 ~= "High" then
  return mp.CLEAN
end
local r0_1 = this_sigattrlog[2]
local r0_2 = this_sigattrlog[3]
if not r0_1.matched and not r0_2.matched then
  return mp.CLEAN
end
local r0_3 = r0_1.matched and r0_1 or r0_2
local r0_4, r0_5 = string.match(r0_3.utf8p2, "^([0-9]+);regionsize:([0-9]+)")
if not isnull(r0_4) and not isnull(r0_5) then
  r0_4 = tonumber(r0_4)
  local r0_6 = tonumber(r0_5)
  if r0_6 < 80000 then
    return mp.CLEAN
  end
  local r0_7, r0_8 = bm.VirtualQuery(r0_4)
  if r0_7 and r0_8.state_type == mp.bitor(mp.SMS_MBI_COMMIT, mp.SMS_MBI_PRIVATE) then
    local r0_9 = 65536
    local r0_10 = r0_4 - r0_4 % r0_9
    local r0_11 = bm.ReadProcMem(r0_10, r0_9)
    if r0_11 ~= nil and mp.readu_u32(r0_11, 1) == 9460301 then
      local r0_12 = mp.readu_u32(r0_11, 61)
      if mp.readu_u32(r0_11, r0_12) ~= 4542464 then
        return mp.CLEAN
      end
      local r0_13 = mp.readu_u16(r0_11, r0_12 + 22 + 1)
      local r0_14 = mp.bitand
      r0_14 = r0_14(r0_13, 8192) ~= 0
      if r0_14 then
        local r0_15 = bm.get_current_process_startup_info()
        TriggerTargetedMemoryScan(r0_10)
        if r0_15 ~= nil and r0_15.ppid ~= nil then
          TrackPidAndTechniqueBM(r0_15.ppid, "T1620", "reflective_dll_loaded")
          return mp.INFECTED
        end
        return mp.CLEAN
      end
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end
return mp.CLEAN
