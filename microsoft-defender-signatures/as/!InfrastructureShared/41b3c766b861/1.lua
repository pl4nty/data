-- Threat: !InfrastructureShared
-- Name: 41b3c766b861
-- Type: 21

if this_sigattrlog[2].matched and this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 then
  local l_0_0 = this_sigattrlog[3].utf8p2
  local l_0_1, l_0_2 = bm.get_process_relationships()
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    local l_0_5 = mp.bitand(l_0_4.reason_ex, 1)
    if l_0_4.image_path ~= nil and l_0_4.ppid ~= nil and not MpCommon.IsFriendlyProcess(l_0_4.ppid) and l_0_5 == 1 then
      bm.trigger_sig("Behavior:Win32/DCOM.MMC20Application!mmc", l_0_0, l_0_4.ppid)
    end
  end
end
return mp.CLEAN
