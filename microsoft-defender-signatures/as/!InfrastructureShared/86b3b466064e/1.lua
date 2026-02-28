local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[2]
    L0_1 = L0_1.matched
    if L0_1 then
      L0_1 = this_sigattrlog
      L0_1 = L0_1[2]
      L0_1 = L0_1.utf8p2
      if L0_1 ~= nil then
        L0_1 = string
        L0_1 = L0_1.lower
        L1_1 = this_sigattrlog
        L1_1 = L1_1[1]
        L1_1 = L1_1.utf8p2
        L0_1 = L0_1(L1_1)
        L1_1 = string
        L1_1 = L1_1.lower
        L2_1 = this_sigattrlog
        L2_1 = L2_1[2]
        L2_1 = L2_1.utf8p1
        L1_1 = L1_1(L2_1)
        L2_1 = string
        L2_1 = L2_1.lower
        L3_1 = this_sigattrlog
        L3_1 = L3_1[2]
        L3_1 = L3_1.utf8p2
        L2_1 = L2_1(L3_1)
        L3_1 = string
        L3_1 = L3_1.match
        L4_1 = L1_1
        L5_1 = "\\classes\\(.+)\\shell"
        L3_1 = L3_1(L4_1, L5_1)
        if L0_1 ~= L3_1 then
          L4_1 = mp
          L4_1 = L4_1.CLEAN
          return L4_1
        end
        L4_1 = string
        L4_1 = L4_1.len
        L5_1 = L2_1
        L4_1 = L4_1(L5_1)
        if L4_1 < 4 then
          L4_1 = mp
          L4_1 = L4_1.CLEAN
          return L4_1
        end
        L4_1 = string
        L4_1 = L4_1.find
        L5_1 = L2_1
        L6_1 = "%1"
        L7_1 = 1
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if L4_1 then
          L4_1 = mp
          L4_1 = L4_1.CLEAN
          return L4_1
        end
        L4_1 = TrackPidAndTechniqueBM
        L5_1 = "BM"
        L6_1 = "T1548.002"
        L7_1 = "uac_bypass_src"
        L4_1(L5_1, L6_1, L7_1)
        L4_1 = {}
        L5_1 = table
        L5_1 = L5_1.insert
        L6_1 = L4_1
        L7_1 = L2_1
        L5_1(L6_1, L7_1)
        L5_1 = versioning
        L5_1 = L5_1.IsSeville
        L5_1 = L5_1()
        if L5_1 then
          L5_1 = versioning
          L5_1 = L5_1.GetCloudBlockLevel
          L5_1 = L5_1()
          if 4 <= L5_1 then
            L5_1 = MpCommon
            L5_1 = L5_1.SetPersistContextNoPath
            L6_1 = "UACBypassExp.T!ShieldUp"
            L7_1 = L4_1
            L8_1 = 300
            L5_1(L6_1, L7_1, L8_1)
            L5_1 = mp
            L5_1 = L5_1.INFECTED
            return L5_1
          end
        end
        L5_1 = MpCommon
        L5_1 = L5_1.SetPersistContextNoPath
        L6_1 = "UACBypassExp.T!regset"
        L7_1 = L4_1
        L8_1 = 10
        L5_1(L6_1, L7_1, L8_1)
        L5_1 = mp
        L5_1 = L5_1.INFECTED
        return L5_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
