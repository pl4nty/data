local L0_1, L1_1

function L0_1()
  local L0_2, L1_2
  L0_2 = isFirstTimeATActive
  L0_2 = L0_2()
  if L0_2 then
    L0_2 = initRQFTAT
    L0_2()
  end
end

Infrastructure_FirstTimeAT = L0_1
