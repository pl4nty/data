local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.enum_mpattributesubstring
L1_1 = "SCRT:BD_JS"
L0_1 = L0_1(L1_1)
L1_1 = #L0_1
if 3 <= L1_1 then
  L1_1 = #L0_1
  if L1_1 <= 10 then
    L1_1 = mp
    L1_1 = L1_1.set_mpattribute
    L2_1 = "Lua:JS.BD.Bad"
    L1_1(L2_1)
end
else
  L1_1 = #L0_1
  if L1_1 == 2 then
    L1_1 = mp
    L1_1 = L1_1.set_mpattribute
    L2_1 = "Lua:JS.BD.Susp"
    L1_1(L2_1)
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
