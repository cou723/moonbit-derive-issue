/// Data type with automatically implemented Show trait
pub enum MyData {
  Value(String)
  Number(Int)  
} derive(Show, Eq)

/// Function to create data
pub fn create_data(s: String) -> MyData {
  Value(s)
}