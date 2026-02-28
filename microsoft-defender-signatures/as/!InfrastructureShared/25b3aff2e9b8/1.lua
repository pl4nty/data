local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = bm
L0_1 = L0_1.get_process_relationships
L0_1, L1_1 = L0_1()
L2_1 = ipairs
L3_1 = L1_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = L6_1.image_path
  if L7_1 ~= nil then
    L7_1 = L6_1.ppid
    if L7_1 ~= nil then
      L7_1 = "browser_childproc"
      L8_1 = L6_1.reason
      L9_1 = bm
      L9_1 = L9_1.RELATIONSHIP_CREATED
      if L8_1 == L9_1 then
        L7_1 = "browser_childproc_created"
      else
        L8_1 = L6_1.reason
        L9_1 = bm
        L9_1 = L9_1.RELATIONSHIP_INJECTION
        if L8_1 == L9_1 then
          L7_1 = "browser_childproc_injected"
        else
          L8_1 = L6_1.reason
          L9_1 = bm
          L9_1 = L9_1.RELATIONSHIP_INHERITED
          if L8_1 == L9_1 then
            L7_1 = "browser_childproc_inherited"
          end
        end
      end
      L8_1 = bm
      L8_1 = L8_1.trigger_sig_target_propagate
      L9_1 = "BM:BrowserChildProc.A"
      L10_1 = L7_1
      L11_1 = L6_1.ppid
      L8_1(L9_1, L10_1, L11_1)
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
