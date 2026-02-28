local L0_1, L1_1
L0_1 = peattributes
L0_1 = L0_1.isexe
if L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.lastscn_writable
  if L0_1 then
    L0_1 = peattributes
    L0_1 = L0_1.self_modifying_code
    if L0_1 then
      L0_1 = peattributes
      L0_1 = L0_1.lastscn_executable
      if L0_1 then
        L0_1 = peattributes
        L0_1 = L0_1.executes_from_last_section
        if L0_1 then
          L0_1 = mp
          L0_1 = L0_1.get_mpattribute
          L1_1 = "expiro_bc_count_loop_cp"
          L0_1 = L0_1(L1_1)
          if not L0_1 then
            L0_1 = mp
            L0_1 = L0_1.get_mpattribute
            L1_1 = "expiro_aw_count_loop_cp"
            L0_1 = L0_1(L1_1)
            if not L0_1 then
              L0_1 = mp
              L0_1 = L0_1.get_mpattribute
              L1_1 = "HSTR:Win32/Exprio.gen!lowfi"
              L0_1 = L0_1(L1_1)
              if not L0_1 then
                goto lbl_43
              end
            end
          end
          L0_1 = mp
          L0_1 = L0_1.set_mpattribute
          L1_1 = "Lua:expiro_returns_ep"
          L0_1(L1_1)
        end
      end
    end
  end
end
::lbl_43::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
