local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L0_1 = L2_1.utf8p1
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L1_1 = L2_1.ppid
  end
end
if L0_1 == nil or L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.sub
L3_1 = L0_1
L4_1 = 1
L5_1 = 1
L2_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 == "%" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = IsLegacyOrgMachine
L2_1, L3_1 = L2_1()
if L2_1 == true then
  L4_1 = bm
  L4_1 = L4_1.trigger_sig
  L5_1 = "LegacyOrgMachine"
  L6_1 = L3_1
  L7_1 = L1_1
  L4_1(L5_1, L6_1, L7_1)
end
L4_1 = this_sigattrlog
L4_1 = L4_1[1]
L4_1 = L4_1.utf8p2
L5_1 = versioning
L5_1 = L5_1.GetCloudBlockLevel
L5_1 = L5_1()
if 4 <= L5_1 then
  L5_1 = IsLegacyOrgMachine
  L5_1 = L5_1()
  if L5_1 == false and L4_1 ~= nil then
    L5_1 = #L4_1
    if 1 <= L5_1 then
      L5_1 = string
      L5_1 = L5_1.find
      L6_1 = L4_1
      L7_1 = " "
      L8_1 = 1
      L9_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if L5_1 ~= nil then
        L6_1 = #L4_1
        if L5_1 ~= L6_1 then
          L6_1 = getCustomStringHash
          L7_1 = L4_1
          L6_1 = L6_1(L7_1)
          if L6_1 ~= nil then
            L7_1 = "CommandLineCustomHash:"
            L8_1 = L6_1
            L7_1 = L7_1 .. L8_1
            L8_1 = MpCommon
            L8_1 = L8_1.GetPersistContextCountNoPath
            L9_1 = L7_1
            L8_1 = L8_1(L9_1)
            if 0 < L8_1 then
              L8_1 = MpCommon
              L8_1 = L8_1.QueryPersistContextNoPath
              L9_1 = L7_1
              L10_1 = L1_1
              L8_1 = L8_1(L9_1, L10_1)
              if not L8_1 then
                L8_1 = MpCommon
                L8_1 = L8_1.GetPersistContextNoPath
                L9_1 = L7_1
                L8_1 = L8_1(L9_1)
                L9_1 = false
                L10_1 = ipairs
                L11_1 = L8_1
                L10_1, L11_1, L12_1 = L10_1(L11_1)
                for L13_1, L14_1 in L10_1, L11_1, L12_1 do
                  L15_1 = #L14_1
                  if 5 <= L15_1 then
                    L15_1 = string
                    L15_1 = L15_1.match
                    L16_1 = L14_1
                    L17_1 = "^[tT][0-9][0-9][0-9][0-9]"
                    L15_1 = L15_1(L16_1, L17_1)
                    if L15_1 then
                      L15_1 = string
                      L15_1 = L15_1.match
                      L16_1 = L14_1
                      L17_1 = "^([tT][0-9][0-9][0-9][0-9][%.]?[0-9]?[0-9]?[0-9]?):?(.*)"
                      L15_1, L16_1 = L15_1(L16_1, L17_1)
                      L17_1 = TrackPidAndTechniqueBM
                      L18_1 = L1_1
                      L19_1 = L15_1
                      L20_1 = L16_1
                      L21_1 = 0
                      L17_1(L18_1, L19_1, L20_1, L21_1)
                      L9_1 = true
                    else
                      L15_1 = string
                      L15_1 = L15_1.sub
                      L16_1 = L14_1
                      L17_1 = 1
                      L18_1 = 1
                      L15_1 = L15_1(L16_1, L17_1, L18_1)
                      if L15_1 == "[" then
                        L15_1 = string
                        L15_1 = L15_1.match
                        L16_1 = L14_1
                        L17_1 = "^%[(.-)%]=(.+)"
                        L15_1, L16_1 = L15_1(L16_1, L17_1)
                        if L15_1 ~= nil and L16_1 ~= nil then
                          L17_1 = bm
                          L17_1 = L17_1.trigger_sig
                          L18_1 = L15_1
                          L19_1 = L16_1
                          L20_1 = L1_1
                          L17_1(L18_1, L19_1, L20_1)
                          L9_1 = true
                        end
                      end
                    end
                  end
                end
                if L9_1 then
                  L10_1 = MpCommon
                  L10_1 = L10_1.AppendPersistContextNoPath
                  L11_1 = L7_1
                  L12_1 = L1_1
                  L13_1 = 0
                  L10_1(L11_1, L12_1, L13_1)
                end
              end
            end
          end
        end
      end
    end
  end
end
L5_1 = MpCommon
L5_1 = L5_1.GetPersistContextCount
L6_1 = L0_1
L5_1 = L5_1(L6_1)
if not (L5_1 <= 0) then
  L6_1 = MpCommon
  L6_1 = L6_1.QueryPersistContextNoPath
  L7_1 = L1_1
  L8_1 = "FilePersistContextToProcessRelay.A"
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 ~= true then
    goto lbl_177
  end
end
L6_1 = mp
L6_1 = L6_1.INFECTED
do return L6_1 end
::lbl_177::
if 100 < L5_1 then
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L6_1 = MpCommon
L6_1 = L6_1.GetPersistContext
L7_1 = L0_1
L6_1 = L6_1(L7_1)
L7_1 = ipairs
L8_1 = L6_1
L7_1, L8_1, L9_1 = L7_1(L8_1)
for L10_1, L11_1 in L7_1, L8_1, L9_1 do
  L12_1 = MpCommon
  L12_1 = L12_1.QueryPersistContextNoPath
  L13_1 = L1_1
  L14_1 = L11_1
  L12_1 = L12_1(L13_1, L14_1)
  if not L12_1 then
    L12_1 = #L11_1
    if 4 <= L12_1 then
      L12_1 = string
      L12_1 = L12_1.match
      L13_1 = L11_1
      L14_1 = "^[tT][0-9][0-9][0-9][0-9]"
      L12_1 = L12_1(L13_1, L14_1)
      if L12_1 then
        L12_1 = string
        L12_1 = L12_1.match
        L13_1 = L11_1
        L14_1 = "^([tT][0-9][0-9][0-9][0-9][%.]?[0-9]?[0-9]?[0-9]?):?(.*)"
        L12_1, L13_1 = L12_1(L13_1, L14_1)
        L14_1 = TrackPidAndTechniqueBM
        L15_1 = L1_1
        L16_1 = L12_1
        L17_1 = L13_1
        L18_1 = nil
        L19_1 = true
        L14_1(L15_1, L16_1, L17_1, L18_1, L19_1)
        L14_1 = #L11_1
        if 5 < L14_1 then
          L14_1 = string
          L14_1 = L14_1.sub
          L15_1 = L11_1
          L16_1 = 0
          L17_1 = 5
          L14_1 = L14_1(L15_1, L16_1, L17_1)
          L15_1 = MpCommon
          L15_1 = L15_1.QueryPersistContextNoPath
          L16_1 = L1_1
          L17_1 = L14_1
          L15_1 = L15_1(L16_1, L17_1)
          if not L15_1 then
            L15_1 = MpCommon
            L15_1 = L15_1.AppendPersistContextNoPath
            L16_1 = L1_1
            L17_1 = L14_1
            L18_1 = 0
            L15_1(L16_1, L17_1, L18_1)
          end
        end
        L14_1 = MpCommon
        L14_1 = L14_1.AppendPersistContextNoPath
        L15_1 = L1_1
        L16_1 = L11_1
        L17_1 = 0
        L14_1(L15_1, L16_1, L17_1)
      end
    end
  end
end
L7_1 = MpCommon
L7_1 = L7_1.QueryPersistContextNoPath
L8_1 = L1_1
L9_1 = "FilePersistContextToProcessRelay.A"
L7_1 = L7_1(L8_1, L9_1)
if not L7_1 then
  L7_1 = MpCommon
  L7_1 = L7_1.AppendPersistContextNoPath
  L8_1 = L1_1
  L9_1 = "FilePersistContextToProcessRelay.A"
  L10_1 = 0
  L7_1(L8_1, L9_1, L10_1)
end
L7_1 = mp
L7_1 = L7_1.INFECTED
return L7_1
