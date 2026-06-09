-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\12eb3010c9c80\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if isnull(l_0_0) then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
local l_0_1 = {}
-- DECOMPILER ERROR at PC37: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC38: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC39: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC40: Overwrote pending register: R4 in 'AssignReg'

if ("\\kubectl.exe")("\\docker.exe", "\\terraform.exe") then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC51: Overwrote pending register: R5 in 'AssignReg'

if (string.find)(l_0_0, "\\program files\\", "\\consul.exe", true) or (string.find)(l_0_0, "\\program files (x86)\\", 1, true) then
  return mp.CLEAN
end
if (mp.IsKnownFriendlyFile)(l_0_0, true, false) then
  return mp.CLEAN
end
local l_0_2 = 140
local l_0_3 = 141
local l_0_4 = (this_sigattrlog[5]).matched
local l_0_5 = {}
-- DECOMPILER ERROR at PC96: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC98: Overwrote pending register: R8 in 'AssignReg'

if not l_0_4 or (this_sigattrlog[6]).matched then
  do
    for l_0_9 = 1, ("\\nomad.exe").SIGATTR_LOG_SZ, "\\helm.exe" do
      -- DECOMPILER ERROR at PC100: Overwrote pending register: R10 in 'AssignReg'

      if (("\\go.exe")[l_0_9]).matched then
        if (sigattr_head[l_0_9]).attribute == 28768 then
          local l_0_10 = (sigattr_head[l_0_9]).utf8p1
          -- DECOMPILER ERROR at PC116: Overwrote pending register: R11 in 'AssignReg'

          -- DECOMPILER ERROR at PC118: Overwrote pending register: R12 in 'AssignReg'

          -- DECOMPILER ERROR at PC119: Overwrote pending register: R13 in 'AssignReg'

          -- DECOMPILER ERROR at PC120: Overwrote pending register: R14 in 'AssignReg'

          if l_0_10 then
            local l_0_11 = (("\\gopls.exe").SNidSearch)("\\dlv.exe", "\\prometheus.exe" .. "\\grafana-server.exe")
          end
        else
          do
            if l_0_11 and (sigattr_head[l_0_9]).attribute == 28769 then
              local l_0_12 = (sigattr_head[l_0_9]).utf8p1
              if l_0_12 then
                local l_0_13 = (MpCommon.SNidSearch)(l_0_3, "00000000" .. l_0_12)
              end
            end
            do
              -- DECOMPILER ERROR at PC149: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC149: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC149: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC149: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC149: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
    if not l_0_13 or not l_0_4 then
      return mp.CLEAN
    end
    ;
    (bm.add_related_file)(l_0_0)
    TrackPidAndTechniqueBM("BM", "T1505.003", "SliverWebShell")
    TrackPidAndTechniqueBM("BM", "T1071.001", "SliverWebShell")
    ;
    (bm.add_related_string)("JA3C: ", l_0_5.TlsJa3CHash or "", bm.RelatedStringBMReport)
    ;
    (bm.add_related_string)("JA3S: ", l_0_5.TlsJa3SHash or "", bm.RelatedStringBMReport)
    ;
    (bm.add_related_string)("NID_JA3C: ", l_0_5.nid_ja3c_match or "", bm.RelatedStringBMReport)
    do return mp.INFECTED end
    -- WARNING: undefined locals caused missing assignments!
  end
end

