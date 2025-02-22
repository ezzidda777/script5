-- Local Script (클라이언트에서 실행)
local DamageEvent = game.ReplicatedStorage:WaitForChild("DamageEvent")
local LocalPlayer = game.Players.LocalPlayer

-- 주변의 플레이어들을 감지하는 코드 (예시)
local function detectTargetAndDealDamage()
    local character = LocalPlayer.Character
    if character then
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        -- 주변에 있는 다른 플레이어를 감지 (예시: 10 스터디 내의 플레이어)
        for _, otherPlayer in ipairs(game.Players:GetPlayers()) do
            if otherPlayer ~= LocalPlayer then
                local target = otherPlayer.Character
                if target and (target:FindFirstChild("Humanoid") and (humanoidRootPart.Position - target.HumanoidRootPart.Position).Magnitude < 10) then
                    -- 타겟을 찾았다면 데미지 요청을 서버에 전송
                    DamageEvent:FireServer(target, 10)  -- 10은 데미지 값 (이 부분은 원하는 데미지 값으로 변경)
                end
            end
        end
    end
end

-- 예시로 1초마다 감지하여 데미지를 주는 부분
while true do
    detectTargetAndDealDamage()
    wait(1)  -- 1초마다 데미지 주기
end
