https://user-images.githubusercontent.com/10343189/224810029-811c8fdb-71cd-4fd9-aa1b-d8dba752d5df.mov

# Aquatic

## 🌊 Aquatic is a 2D fluid simulation written in Swift that runs natively on the Apple Platforms.
It’s built on top of SpriteKit: the Apple framework for 2D high performance animations.
It leverages the CPU for the physics simulation and the GPU for the visual effects.

## ⚙️ HOW IT WORKS
1. Add many tiny circular physics bodies (particles) to simulate water at "molecular" level.
2. Apply Blur to visually blend these particles together.
3. Run on the GPU a simple Shader to “flatten” the generated image.

## 🕕 16 MILLISECONDS
The beauty of writing time critical code (such as games and simulations) is that you need to ensure 60 frames per seconds, otherwise the magic will suddenly break, and the user will leave.
That means you have 16 milliseconds to run all the code that renders each frame. This insane constraint is a great tool because it forces you to be mindful about the complexity of every single line of code you write.

## ✅ 3 TAKES AWAY
- The GPU is a machine for parallel computation, learn how to use it properly, and you will skyrocket the speed of your app.
- Like every game oriented tool, SpriteKit is fast. Embrace it if you want to add awesome effects to your iOS, macOS, tvOS, and watchOS app.
- SpriteKit contains a 2D physics engine that you can leverage to build realistic simulations.
