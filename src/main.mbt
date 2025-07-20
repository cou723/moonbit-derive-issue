fn main {
  // Create data via wrapper package
  let data = @wrapper.create_data("hello")
  
  // Issue: Try to use Show trait via type alias
  println("Data: " + data.to_string())  // ← This should cause an error
}