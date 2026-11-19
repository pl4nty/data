-- Threat: !InfrastructureShared
-- Name: 25b33a00222f
-- Type: 21

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

function shadowdel(p1_0, p1_1)
  for r1_0 = 1, p1_1 do
    bm.trigger_sig("VSSAMSI", p1_0, p1_0)
    local r1_1 = mp.GetParentProcInfo(p1_0)
    if r1_1 == nil then
      break
    end
    local r1_2 = r1_1.image_path
    if not r1_2 or not r1_2:match("\\([^\\]+)$") then
      break
    end
    p1_0 = r1_1.ppid
  end
end

local r0_0 = MpCommon.GetPersistContextNoPath("vssamsipid")
for r0_1, r0_2 in ipairs(r0_0) do
  shadowdel(r0_2, 4)
end
return mp.CLEAN
