-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\31ab350766fcc\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC11: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[13]).matched then
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5, l_0_6, l_0_7, l_0_8, l_0_9, l_0_10, l_0_11, l_0_12, l_0_13, l_0_14, l_0_15, l_0_16, l_0_17, l_0_18 = nil
  else
  end
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC38: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC47: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC56: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC65: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC74: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC83: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC92: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC101: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC110: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC119: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC128: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC137: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC146: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC155: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC164: Confused about usage of register: R0 in 'UnsetPending'

  if (not (this_sigattrlog[14]).matched or (string.lower)((this_sigattrlog[14]).utf8p2) ~= nil) and ((string.find)((string.lower)((this_sigattrlog[14]).utf8p2), "https://dev.azure.com", 1, true) or (string.find)((string.lower)((this_sigattrlog[14]).utf8p2), "https://portalpre.inmocaixa.com", 1, true) or (string.find)((string.lower)((this_sigattrlog[14]).utf8p2), "https://www.nfbio.dk", 1, true) or (string.find)((string.lower)((this_sigattrlog[14]).utf8p2), "https://lsp.accenture.com", 1, true) or (string.find)((string.lower)((this_sigattrlog[14]).utf8p2), "mgpprx.mgg.local", 1, true) or (string.find)((string.lower)((this_sigattrlog[14]).utf8p2), "/usr/bin/containerd-shim-runc-v2 ", 1, true) or (string.find)((string.lower)((this_sigattrlog[14]).utf8p2), "hooks.slack.com", 1, true) or (string.find)((string.lower)((this_sigattrlog[14]).utf8p2), "/gdconf.com/", 1, true) or (string.find)((string.lower)((this_sigattrlog[14]).utf8p2), ".emirates.com", 1, true) or (string.find)((string.lower)((this_sigattrlog[14]).utf8p2), " -xe /tmp/jenkins", 1, true) or (string.find)((string.lower)((this_sigattrlog[14]).utf8p2), "/sbiptvappprd01/CMS/plugin/_Dashboard", 1, true) or (string.find)((string.lower)((this_sigattrlog[14]).utf8p2), "taylorfrancis.com/", 1, true) or (string.find)((string.lower)((this_sigattrlog[14]).utf8p2), "curl -k -u elastic:", 1, true) or (string.find)((string.lower)((this_sigattrlog[14]).utf8p2), "https://blackhateurope.informatech.com/", 1, true) or (string.find)((string.lower)((this_sigattrlog[14]).utf8p2), "https://blackhat.informafestivals.com/", 1, true) or (string.find)((string.lower)((this_sigattrlog[14]).utf8p2), "rs-arh.global.mgroot.net", 1, true)) then
    return mp.CLEAN
  end
  TrackPidAndTechniqueBM("BM", "T1505.003", "Persistence_Webshell")
  return mp.INFECTED
end

