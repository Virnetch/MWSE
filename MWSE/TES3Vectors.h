#pragma once

namespace TES3 {
	struct Matrix33;

	template <typename T>
	struct Range {
		T min;
		T max;
	};
	static_assert(sizeof(Range<int>) == 0x8, "TES3::Range<int> failed size validation");

	struct Vector2 {
		float x;
		float y;

		Vector2() : x(0), y(0) {}
		Vector2(float _x, float _y) : x(_x), y(_y) {}
	};
	static_assert(sizeof(Vector2) == 0x8, "TES3::Vector2 failed size validation");

	struct Vector3 : Vector2 {
		float z;

		Vector3() : Vector2(), z(0) {}
		Vector3(float _x, float _y, float _z) : Vector2(_x, _y), z(_z) {}

		bool operator==(const Vector3& matrix) const;
		bool operator!=(const Vector3& matrix) const;
		Vector3 operator+(const Vector3&) const;
		Vector3 operator-(const Vector3&) const;
		Vector3 operator*(const Vector3&) const;
		Vector3 operator*(const float) const;

		//
		// Associated functions.
		//

		Vector3 crossProduct(Vector3*) const;
		float dotProduct(Vector3*) const;
		Matrix33 outerProduct(Vector3*) const;
			
		float heightDifference(Vector3*) const;
		float distance(Vector3*) const;
		float length() const;
		void negate();
		bool normalize();
		Vector3 normalized() const;
		Vector3 interpolate(const Vector3&, const float) const;

	};
	static_assert(sizeof(Vector3) == 0xC, "TES3::Vector3 failed size validation");

	struct Vector4 : Vector3 {
		float w;

		Vector4() : Vector3(), w(0) {}
		Vector4(float _x, float _y, float _z, float _w) : Vector3(_x, _y, _z), w(_w) {}
	};
	static_assert(sizeof(Vector4) == 0x10, "TES3::Vector4 failed size validation");

	struct Matrix33 {
		Vector3 m0;
		Vector3 m1;
		Vector3 m2;

		Matrix33();
		Matrix33(Vector3* m0, Vector3* m1, Vector3* m2);
		Matrix33(float m0x, float m0y, float m0z, float m1x, float m1y, float m1z, float m2x, float m2y, float m2z);

		//
		// Basic operators.
		//

		bool operator==(const Matrix33& matrix);
		bool operator!=(const Matrix33& matrix);
		Matrix33 operator+(const Matrix33& matrix);
		Matrix33 operator-(const Matrix33& matrix);
		Matrix33 operator*(const Matrix33& matrix);
		Vector3 operator*(const Vector3& vector);
		Matrix33 operator*(float scalar);

		//
		// Set the matrix to specific useful values.
		//

		void toZero();
		void toIdentity();
		void toRotationX(float x);
		void toRotationY(float y);
		void toRotationZ(float z);
		void toRotation(float angle, float x, float y, float z);

		//
		// Other related helper functions.
		//

		Matrix33 transpose();

		Matrix33 invert();
		bool invert(Matrix33 * out_matrix);

		void fromEulerXYZ(float x, float y, float z);
		bool toEulerXYZ(float * x, float * y, float * z);
		bool toEulerZYX(float * x, float * y, float * z);

		bool reorthogonalize();

	};
	static_assert(sizeof(Matrix33) == 0x24, "TES3::Matrix33 failed size validation");

	struct BoundingBox {
		Vector3 minimum;
		Vector3 maximum;
	};
	static_assert(sizeof(BoundingBox) == 0x18, "TES3::BoundingBox failed size validation");

	struct Transform {
		TES3::Matrix33 rotation;
		TES3::Vector3 translation;
		float scale;
	};
	static_assert(sizeof(Transform) == 0x34, "TES3::Transform failed size validation");
}
